//
//  File.swift
//  
//
//  Created by Dmitry Bespalov on 22.07.22.
//

import Foundation
import CoreData

public class CDContainer: NSPersistentContainer {
    public init(name: String, bundle: Bundle = .main, inMemory: Bool = false) {
        guard let model = NSManagedObjectModel.mergedModel(from: [bundle]) else {
            fatalError("Failed to create mom")
        }
        super.init(name: name, managedObjectModel: model)
        if inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            description.shouldAddStoreAsynchronously = false
            persistentStoreDescriptions = [description]
        }
    }

    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }

    func allPasscodes(completion: @escaping ([CDPasscode]) -> Void) {
        performBackgroundTask { context in
            let request = CDPasscode.fetchRequest()
            request.sortDescriptors = []
            do {
                let results = try context.fetch(request)
                completion(results)
            } catch {
                print("Error fetching passcodes: \(error)")
                completion([])
            }
        }
    }
}
