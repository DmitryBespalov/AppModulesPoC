//
//  CDPasscode+CoreDataProperties.swift
//  MoudlarApp
//
//  Created by Dmitry Bespalov on 22.07.22.
//
//

import Foundation
import CoreData


extension CDPasscode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPasscode> {
        return NSFetchRequest<CDPasscode>(entityName: "CDPasscode")
    }

    @NSManaged public var createdDate: Date?
    @NSManaged public var encryptedPasscode: Data?
    @NSManaged public var updatedDate: Date?
    @NSManaged public var failedAttempts: Int16

}

