//
//  VDAggregate+CoreDataProperties.swift
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

extension VDAggregate {

    @NSManaged var rCo2Saved: NSDecimalNumber?
    @NSManaged var rDistance: NSDecimalNumber?
    @NSManaged var rDriveTime: NSNumber?
    @NSManaged var rEndTime: NSDate?
    @NSManaged var rForDevice: NSNumber?
    @NSManaged var rFuelSaved: NSDecimalNumber?
    @NSManaged var rFuelUsed: NSDecimalNumber?
    @NSManaged var rId: NSNumber?
    @NSManaged var rIdleTimeSaved: NSNumber?
    @NSManaged var rLinkedId: NSNumber?
    @NSManaged var rNumEvents: NSNumber?
    @NSManaged var rNumTrips: NSNumber?
    @NSManaged var rStartTime: NSDate?
    @NSManaged var rTimeStopped: NSNumber?
    @NSManaged var rType: NSNumber?
    @NSManaged var rAggUser: VDUser?
    @NSManaged var rAlerts: NSSet?
    @NSManaged var rDevice: VDDevice?
    @NSManaged var rDeviceLastAggregateFor: VDDevice?
    @NSManaged var rTrips: NSSet?
    @NSManaged var rUser: VDUser?
    @NSManaged var rUserLastAggregateFor: VDUser?

}
