//
//  VDDeviceSettings+CoreDataProperties.swift
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

extension VDDeviceSettings {

    @NSManaged var rAutoKeyAllowed: NSNumber?
    @NSManaged var rAutoStopEnabled: NSNumber?
    @NSManaged var rAutoStopTime: NSNumber?
    @NSManaged var rDriverDoorOnly: NSNumber?
    @NSManaged var rImmobilizerEnabled: NSNumber?
    @NSManaged var rImmobTimes: NSData?
    @NSManaged var rKeylessEnabled: NSNumber?
    @NSManaged var rMobilizeOnProximityEnabled: NSNumber?
    @NSManaged var rPrivacySettings: NSNumber?
    @NSManaged var rScheduledImmobilizerEnabled: NSNumber?
    @NSManaged var rStartStopEnabled: NSNumber?
    @NSManaged var rStopAtParkEnabled: NSNumber?
    @NSManaged var rDevice: VDDevice?

}
