//
//  VDIntersection+CoreDataProperties.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/29/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension VDIntersection {

    @NSManaged var rLatitude: NSDecimalNumber?
    @NSManaged var rLongitude: NSDecimalNumber?
    @NSManaged var rName: String?
    @NSManaged var rAveStopTime: NSNumber?
    @NSManaged var rDevicesNextIntersectionFor: NSSet?

}
