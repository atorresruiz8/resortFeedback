//
//  Food+CoreDataProperties.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/26/21.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var rating: Double

}

extension Food : Identifiable {

}
