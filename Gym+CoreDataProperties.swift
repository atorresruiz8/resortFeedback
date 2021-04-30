//
//  Gym+CoreDataProperties.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/26/21.
//
//

import Foundation
import CoreData


extension Gym {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Gym> {
        return NSFetchRequest<Gym>(entityName: "Gym")
    }

    @NSManaged public var rating: Double

}

extension Gym : Identifiable {

}
