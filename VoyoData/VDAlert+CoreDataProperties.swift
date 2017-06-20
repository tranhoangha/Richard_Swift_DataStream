//
//  VDAlert+CoreDataProperties.swift
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

extension VDAlert {

    @NSManaged var rActive: NSNumber?
    @NSManaged var rEnd: NSDate?
    @NSManaged var rHasBeenDeleted: NSNumber?
    @NSManaged var rIcon: NSNumber?
    @NSManaged var rId: NSNumber?
    @NSManaged var rLatitude: NSDecimalNumber?
    @NSManaged var rLongDescription: String?
    @NSManaged var rLongitude: NSDecimalNumber?
    @NSManaged var rName: String?
    @NSManaged var rSeverity: NSNumber?
    @NSManaged var rShortDescription: String?
    @NSManaged var rStart: NSDate?
    @NSManaged var rType: NSNumber?
    @NSManaged var rAggregates: NSSet?
    @NSManaged var rDevice: VDDevice?
    @NSManaged var rTrip: VDTrip?
    @NSManaged var rUsers: NSSet?
    @NSManaged var rVehicle: VDVehicle?

}
