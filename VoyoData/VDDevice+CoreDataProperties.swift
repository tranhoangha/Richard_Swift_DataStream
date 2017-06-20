//
//  VDDevice+CoreDataProperties.swift
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

extension VDDevice {

    @NSManaged var rEncryptionKey: NSData?
    @NSManaged var rName: String?
    @NSManaged var rSerial: NSNumber?
    @NSManaged var rVersion: String?
    @NSManaged var rActiveDtcs: NSSet?
    @NSManaged var rAggregates: NSSet?
    @NSManaged var rAlerts: NSSet?
    @NSManaged var rAvatar: VDImage?
    @NSManaged var rDTCs: NSSet?
    @NSManaged var rLastDailyAggregate: VDAggregate?
    @NSManaged var rLastTrip: VDTrip?
    @NSManaged var rPendingAvatar: VDImage?
    @NSManaged var rSettingChanges: NSSet?
    @NSManaged var rSettings: VDDeviceSettings?
    @NSManaged var rTrips: NSSet?
    @NSManaged var rUserPermissions: NSSet?
    @NSManaged var rRequestsForDevice: NSSet?
    @NSManaged var rLastPoint: VDPoint?
    @NSManaged var rNextIntersection: VDIntersection?

}
