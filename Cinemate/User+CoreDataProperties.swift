//
//  User+CoreDataProperties.swift
//  
//
//  Created by Md. Mehedi Hasan on 30/1/20.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?

}
