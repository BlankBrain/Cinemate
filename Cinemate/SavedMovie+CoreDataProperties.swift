//
//  SavedMovie+CoreDataProperties.swift
//  
//
//  Created by Md. Mehedi Hasan on 7/2/20.
//
//

import Foundation
import CoreData


extension SavedMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedMovie> {
        return NSFetchRequest<SavedMovie>(entityName: "SavedMovie")
    }

    @NSManaged public var user: String?
    @NSManaged public var title: String?
    @NSManaged public var relese: String?
    @NSManaged public var imdb: String?
    @NSManaged public var rt: String?
    @NSManaged public var meta: String?
    @NSManaged public var plot: String?
    @NSManaged public var actors: String?
    @NSManaged public var box: String?
    @NSManaged public var has: User?

}
