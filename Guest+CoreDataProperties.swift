//
//  Guest+CoreDataProperties.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/26/21.
//
//

import Foundation
import CoreData


extension Guest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Guest> {
        return NSFetchRequest<Guest>(entityName: "Guest")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension Guest : Identifiable {

}
