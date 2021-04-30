//
//  Overall+CoreDataProperties.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/26/21.
//
//

import Foundation
import CoreData


extension Overall {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Overall> {
        return NSFetchRequest<Overall>(entityName: "Overall")
    }

    @NSManaged public var rating: Double

}

extension Overall : Identifiable {

}
