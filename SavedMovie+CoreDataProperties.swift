//
//  SavedMovie+CoreDataProperties.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 10/2/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
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
