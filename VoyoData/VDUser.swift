//
//  VDUser.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDUser: NSManagedObject {
    public class func getUserForId(id: NSNumber, withContext: VoyoDataContext) -> VDUser? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func createUserForId(id: NSNumber, andName:String, withContext: VoyoDataContext) -> VDUser {
        let user = getUserForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        user.rId = id
        user.rUserName = andName
        user.rUserNameLowerCase = andName.lowercaseString
        return user
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var userName : String {
        get { return synced(managedObjectContext) { return self.rUserName ?? "" } }
/*        set(u) {
            synced(managedObjectContext) {
                self.rUserName = u
                self.rUserNameLowerCase = u.lowercaseString
            }
        }*/
    }
    public var userNameLowerCase : String {
        get { return synced(managedObjectContext) { return self.rUserNameLowerCase ?? "" } }
    }
    public var email : String {
        get { return synced(managedObjectContext) { return self.rEmail ?? "" } }
        set(e) { synced(managedObjectContext) { self.rEmail = e } }
    }
    public var firstName : String {
        get { return synced(managedObjectContext) { return self.rFirstName ?? "" } }
        set(f) { synced(managedObjectContext) { self.rFirstName = f } }
    }
    public var lastName : String {
        get { return synced(managedObjectContext) { return self.rLastName ?? "" } }
        set(l) { synced(managedObjectContext) { self.rLastName = l } }
    }
    public var lastUpdated : NSDate {
        get { return synced(managedObjectContext) { return self.rLastUpdated ?? NSDate.distantPast() } }
        set(l) { synced(managedObjectContext) { self.rLastUpdated = l } }
    }
    public var phoneNumber : String {
        get { return synced(managedObjectContext) { return self.rPhoneNumber ?? "" } }
        set(p) { synced(managedObjectContext) { self.rPhoneNumber = p } }
    }
    public var timeTermsLastAccepted : NSDate {
        get { return synced(managedObjectContext) { return self.rTimeTermsLastAccepted ?? NSDate.distantPast() } }
        set(t) { synced(managedObjectContext) { self.rTimeTermsLastAccepted = t } }
    }


    public var aggregates : [VDAggregate] {
        get { return synced(managedObjectContext) { return (self.rAggregates?.allObjects as? [VDAggregate]) ?? [] } }
        set(a) { synced(managedObjectContext) { self.rAggregates = NSSet(array: a) } }
    }
    public var lastDailyAggregate : VDAggregate? {
        get { return synced(managedObjectContext) { return self.rLastDailyAggregate } }
        set(l) { synced(managedObjectContext) { self.rLastDailyAggregate = l } }
    }
    public var myAggregates : [VDAggregate] {
        get { return synced(managedObjectContext) { return (self.rMyAggregates?.allObjects as? [VDAggregate]) ?? [] } }
        set(m) { synced(managedObjectContext) { self.rMyAggregates = NSSet(array: m) } }
    }
    public var contacts : [VDContact] {
        get { return synced(managedObjectContext) { return (self.rContacts?.allObjects as? [VDContact]) ?? [] } }
        set(c) { synced(managedObjectContext) { self.rContacts = NSSet(array: c) } }
    }
    public var avatar : VDImage? {
        get { return synced(managedObjectContext) { return self.rAvatar } }
        set(a) { synced(managedObjectContext) { self.rAvatar = a } }
    }
    public var pendingAvatar : VDImage? {
        get { return synced(managedObjectContext) { return self.rPendingAvatar } }
        set(p) { synced(managedObjectContext) { self.rPendingAvatar = p } }
    }
    public var devicePermissions : [VDPermission] {
        get { return synced(managedObjectContext) { return (self.rDevicePermissions?.allObjects as? [VDPermission]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rDevicePermissions = NSSet(array: d) } }
    }
    public var lastPoint : VDPoint? {
        get { return synced(managedObjectContext) { return self.rLastPoint } }
        set(l) { synced(managedObjectContext) { self.rLastPoint = l } }
    }
    public var tableDates : [VDTables] {
        get { return synced(managedObjectContext) { return (self.rTableDates?.allObjects as? [VDTables]) ?? [] } }
        set(t) { synced(managedObjectContext) { self.rTableDates = NSSet(array: t) } }
    }
    public var termsAccepted : VDTerms? {
        get { return synced(managedObjectContext) { return self.rTermsAccepted } }
        set(t) { synced(managedObjectContext) { self.rTermsAccepted = t } }
    }
    public var alerts : [VDUserAlerts] {
        get { return synced(managedObjectContext) { return (self.rAlerts?.allObjects as? [VDUserAlerts]) ?? [] } }
        set(a) { synced(managedObjectContext) { self.rAlerts = NSSet(array: a) } }
    }
    public var requests : [VDUserRequest] {
        get { return synced(managedObjectContext) { return (self.rRequests?.allObjects as? [VDUserRequest]) ?? [] } }
        set(r) { synced(managedObjectContext) { self.rRequests = NSSet(array: r) } }
    }
    public var requestsSent : [VDUserRequest] {
        get { return synced(managedObjectContext) { return (self.rRequestsSent?.allObjects as? [VDUserRequest]) ?? [] } }
        set(r) { synced(managedObjectContext) { self.rRequestsSent = NSSet(array: r) } }
    }
    public var settings : VDUserSettings? {
        get { return synced(managedObjectContext) { return self.rSettings } }
        set(s) { synced(managedObjectContext) { self.rSettings = s } }
    }
    public var settingChanges : [VDUserSettingsChanges] {
        get { return synced(managedObjectContext) { return (self.rSettingChanges?.allObjects as? [VDUserSettingsChanges]) ?? [] } }
        set(s) { synced(managedObjectContext) { self.rSettingChanges = NSSet(array: s) } }
    }
    public var lastTrip : VDUserTrips? {
        get { return synced(managedObjectContext) { return self.rLastTrip } }
        set(l) { synced(managedObjectContext) { self.rLastTrip = l } }
    }
    public var trips : [VDUserTrips] {
        get { return synced(managedObjectContext) { return (self.rTrips?.allObjects as? [VDUserTrips]) ?? [] } }
        set(t) { synced(managedObjectContext) { self.rTrips = NSSet(array: t) } }
    }
    
    public var lastLocationUpdate : NSDate { get { return synced(managedObjectContext) { return self.lastPoint?.time ?? NSDate.distantPast() } } }
    public var latitude : NSDecimalNumber { get { return synced(managedObjectContext) { return self.lastPoint?.latitude ?? 0 } } }
    public var longitude : NSDecimalNumber { get { return synced(managedObjectContext) { return self.lastPoint?.longitude ?? 0 } } }
    public var orientation : NSNumber { get { return synced(managedObjectContext) { return self.lastPoint?.orientation ?? 0 } } }
}
