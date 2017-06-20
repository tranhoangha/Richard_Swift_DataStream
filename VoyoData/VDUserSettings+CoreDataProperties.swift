//
//  VDUserSettings+CoreDataProperties.swift
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

extension VDUserSettings {

    @NSManaged var rAccidentNotificationsEnabled: NSNumber?
    @NSManaged var rAutoKeyEnabled: NSNumber?
    @NSManaged var rAwardsEnabled: NSNumber?
    @NSManaged var rBehaviorNotificationsEnabled: NSNumber?
    @NSManaged var rCommunityAwardsEnabled: NSNumber?
    @NSManaged var rDiagnosticNotificationsEnabled: NSNumber?
    @NSManaged var rEmergencyContactsEnabled: NSNumber?
    @NSManaged var rMyAwardsEnabled: NSNumber?
    @NSManaged var rNotificationByEmailEnabled: NSNumber?
    @NSManaged var rNotificationByPhoneEnabled: NSNumber?
    @NSManaged var rNotificationByTextEnabled: NSNumber?
    @NSManaged var rNotificationsEnabled: NSNumber?
    @NSManaged var rOverspeed: NSDecimalNumber?
    @NSManaged var rPrivacySettings: NSNumber?
    @NSManaged var rSecurityNotificationsEnabled: NSNumber?
    @NSManaged var rThresholdNotificationsEnabled: NSNumber?
    @NSManaged var rTrafficAlertsEnabled: NSNumber?
    @NSManaged var rUnitSystem: NSNumber?
    @NSManaged var rUser: VDUser?

}
