//
//  File.swift
//  
//
//  Created by Dmitry Bespalov on 22.07.22.
//

import Foundation
import CryptoKit

let passcodeObfuscationKey = ";-`HY`nUA&-6o!46a^:3|H$z<|C.O`T~"

public class PasscodeStore {
    private let container: CDContainer

    public init(inMemory: Bool = false, completion: @escaping () -> Void = { }) {
        container = CDContainer(name: "Model", bundle: .module, inMemory: inMemory)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved CoreData error \(error), \(error.userInfo)")
            }
            completion()
        }
    }

    func allPasscodes(completion: @escaping ([CDPasscode]) -> Void) {
        container.allPasscodes(completion: completion)
    }

    func createPasscode(plaintext: String, completion: @escaping (CDPasscode?) -> Void) {
        container.performBackgroundTask { [unowned self] context in
            // encrypt passcode
            let ciphertext: Data?
            do {
                // derive a key from obfuscation key
                let key = HKDF<SHA256>.deriveKey(inputKeyMaterial: SymmetricKey(data: passcodeObfuscationKey.data(using: .utf8)!), outputByteCount: 32)
                // encrypt with symmetric encryption
                let box = try AES.GCM.seal(plaintext.data(using: .utf8)!, using: key)
                ciphertext = box.combined
            } catch {
                print("Failed to encrypt passcode: \(error)")
                completion(nil)
                return
            }

            guard let data = ciphertext else {
                print("Failed to encrypt: cyphertext is nil")
                completion(nil)
                return
            }

            // create passcode object
            let passcode = CDPasscode(context: context)
            passcode.encryptedPasscode = data
            passcode.createdDate = Date()
            passcode.updatedDate = Date()
            passcode.failedAttempts = 0

            container.saveContext(backgroundContext: context)

            completion(passcode)
        }
    }
}
