//
//  PasscodeViewController.swift
//  
//
//  Created by Dmitry Bespalov on 22.07.22.
//

import UIKit
import CommonUI

public class PasscodeViewController: UIViewController, UITextFieldDelegate {

    public var completion: (() -> Void)?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var moduleImageView: UIImageView!
    @IBOutlet weak var importedModuleImageView: UIImageView!

    var store: PasscodeStore!

    convenience init() {
        self.init(nibName: nil, bundle: Bundle.module)
        store = PasscodeStore()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        importedModuleImageView.image = UIImage(named: "OvalRandomIcon", in: .commonUI, compatibleWith: nil)
        textField.becomeFirstResponder()

        store.allPasscodes { results in
            print("Fetched results: \(results)")
        }
    }

    @IBAction func done(_ sender: Any) {
        save()
        completion?()
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func save() {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else {
            return
        }

        store.createPasscode(plaintext: text) { newPasscode in
            guard let newPasscode = newPasscode else {
                return
            }

            print("Created: \(newPasscode)")
        }
    }
}
