//
//  VDPoint+CoreDataProperties.swift
//  VoyoData
//
//  Created by Eric Domeier on 5/2/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension VDPoint {

    @NSManaged var rTime: NSDate?
    @NSManaged var rLatitude: NSDecimalNumber?
    @NSManaged var rLongitude: NSDecimalNumber?
    @NSManaged var rOrientation: NSNumber?
    @NSManaged var rId: NSNumber?
    @NSManaged var rDeviceLastPointFor: VDDevice?
    @NSManaged var rTrip: VDTripPoint?
    @NSManaged var rUserLastPointFor: VDUser?

}
