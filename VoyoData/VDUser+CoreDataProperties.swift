//
//  VDUser+CoreDataProperties.swift
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

extension VDUser {

    @NSManaged var rEmail: String?
    @NSManaged var rFirstName: String?
    @NSManaged var rId: NSNumber?
    @NSManaged var rLastName: String?
    @NSManaged var rLastUpdated: NSDate?
    @NSManaged var rPhoneNumber: String?
    @NSManaged var rTimeTermsLastAccepted: NSDate?
    @NSManaged var rUserName: String?
    @NSManaged var rUserNameLowerCase: String?
    @NSManaged var rAggregates: NSSet?
    @NSManaged var rAlerts: NSSet?
    @NSManaged var rAvatar: VDImage?
    @NSManaged var rContacts: NSSet?
    @NSManaged var rDevicePermissions: NSSet?
    @NSManaged var rLastDailyAggregate: VDAggregate?
    @NSManaged var rLastTrip: VDUserTrips?
    @NSManaged var rMyAggregates: NSSet?
    @NSManaged var rPendingAvatar: VDImage?
    @NSManaged var rRequests: NSSet?
    @NSManaged var rRequestsSent: NSSet?
    @NSManaged var rSettingChanges: NSSet?
    @NSManaged var rSettings: VDUserSettings?
    @NSManaged var rTableDates: NSSet?
    @NSManaged var rTermsAccepted: VDTerms?
    @NSManaged var rTrips: NSSet?
    @NSManaged var rLastPoint: VDPoint?
    @NSManaged var rEventsReported: NSSet?

}
