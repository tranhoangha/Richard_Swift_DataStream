//
//  VDTrip+CoreDataProperties.swift
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

extension VDTrip {

    @NSManaged var rCo2Saved: NSDecimalNumber?
    @NSManaged var rDistanceDriven: NSDecimalNumber?
    @NSManaged var rEndTime: NSDate?
    @NSManaged var rFuelSaved: NSDecimalNumber?
    @NSManaged var rFuelUsed: NSDecimalNumber?
    @NSManaged var rHasBeenDeleted: NSNumber?
    @NSManaged var rId: NSNumber?
    @NSManaged var rIdleTimeSaved: NSNumber?
    @NSManaged var rLastUpdated: NSDate?
    @NSManaged var rNumPoints: NSNumber?
    @NSManaged var rStartTime: NSDate?
    @NSManaged var rStopTime: NSNumber?
    @NSManaged var rTimeDriven: NSNumber?
    @NSManaged var rAggregates: NSSet?
    @NSManaged var rAlerts: NSSet?
    @NSManaged var rDevice: VDDevice?
    @NSManaged var rDeviceLastTripFor: VDDevice?
    @NSManaged var rPoints: NSSet?
    @NSManaged var rUsers: NSSet?

}
