//
//  Spa+CoreDataProperties.swift
//  ResortFeedback
//
//  Created by Antonio Torres-Ruiz on 4/26/21.
//
//

import Foundation
import CoreData


extension Spa {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Spa> {
        return NSFetchRequest<Spa>(entityName: "Spa")
    }

    @NSManaged public var rating: Double

}

extension Spa : Identifiable {

}
