//
//  User+CoreDataProperties.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 10/2/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var owns: NSSet?

}

// MARK: Generated accessors for owns
extension User {

    @objc(addOwnsObject:)
    @NSManaged public func addToOwns(_ value: SavedMovie)

    @objc(removeOwnsObject:)
    @NSManaged public func removeFromOwns(_ value: SavedMovie)

    @objc(addOwns:)
    @NSManaged public func addToOwns(_ values: NSSet)

    @objc(removeOwns:)
    @NSManaged public func removeFromOwns(_ values: NSSet)

}
