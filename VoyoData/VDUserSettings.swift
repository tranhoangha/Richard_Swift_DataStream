//
//  VDUserSettings.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDUserSettings: NSManagedObject {
    public class func getSettingsForUser(user: VDUser, withContext: VoyoDataContext) -> VDUserSettings? {
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rUser = %@", user)
        return withContext.executeFetchRequest(request).first
    }
    public class func createSettingsForUser(user: VDUser, withContext: VoyoDataContext) -> VDUserSettings {
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        let settings = getSettingsForUser(user, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        settings.rUser = user
        return settings
    }
    
// Insert code here to add functionality to your managed object subclass
    public var user : VDUser {
        get { return synced(managedObjectContext) { return self.rUser! } }
//        set(u) { synced(managedObjectContext) { self.rUser = u } }
    }
    
    public var accidentNotificationsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rAccidentNotificationsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rAccidentNotificationsEnabled = a } }
    }
    public var autoKeyEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rAutoKeyEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rAutoKeyEnabled = a } }
    }
    public var awardsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rAwardsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rAwardsEnabled = a } }
    }
    public var behaviorNotificationsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rBehaviorNotificationsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rBehaviorNotificationsEnabled = a } }
    }
    public var communityAwardsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rCommunityAwardsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rCommunityAwardsEnabled = a } }
    }
    public var diagnosticNotificationsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rDiagnosticNotificationsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rDiagnosticNotificationsEnabled = a } }
    }
    public var emergencyContactsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rEmergencyContactsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rEmergencyContactsEnabled = a } }
    }
    public var myAwardsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rMyAwardsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rMyAwardsEnabled = a } }
    }
    public var notificationByEmailEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rNotificationByEmailEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rNotificationByEmailEnabled = a } }
    }
    public var notificationByPhoneEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rNotificationByPhoneEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rNotificationByPhoneEnabled = a } }
    }
    public var notificationByTextEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rNotificationByTextEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rNotificationByTextEnabled = a } }
    }
    public var notificationsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rNotificationsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rNotificationsEnabled = a } }
    }
    public var overspeed : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rOverspeed ?? 0 } }
        set(a) { synced(managedObjectContext) { self.rOverspeed = a } }
    }
    public var privacySetting : PrivacySetting {
        get { return synced(managedObjectContext) { return PrivacySetting(rawValue: self.rPrivacySettings ?? 0) ?? PrivacySetting.NoSending } }
        set(a) { synced(managedObjectContext) { self.rPrivacySettings = a.rawValue } }
    }
    public var securityNotificationsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rSecurityNotificationsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rSecurityNotificationsEnabled = a } }
    }
    public var thresholdNotificationsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rThresholdNotificationsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rThresholdNotificationsEnabled = a } }
    }
    public var trafficAlertsEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rTrafficAlertsEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rTrafficAlertsEnabled = a } }
    }
    public var unitSystem : UnitSystem {
        get { return synced(managedObjectContext) { return UnitSystem(rawValue: self.rUnitSystem ?? 0) ?? UnitSystem.Metric } }
        set(u) { synced(managedObjectContext) { self.rUnitSystem = u.rawValue } }
    }

}
