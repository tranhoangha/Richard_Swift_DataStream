//
//  VDDevice.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDDevice: NSManagedObject {
    public class func getDeviceForSerial(serial: NSNumber, withContext: VoyoDataContext) -> VDDevice? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rSerial = %@", serial)
        return withContext.executeFetchRequest(request).first
    }
    public class func createDeviceForSerial(serial: NSNumber, withContext: VoyoDataContext) -> VDDevice {
        let device = getDeviceForSerial(serial, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        device.rSerial = serial
        return device
    }
    
// Insert code here to add functionality to your managed object subclass
    public var serial : NSNumber {
        get { return synced(managedObjectContext) { return self.rSerial ?? 0 } }
//        set(s) { synced(managedObjectContext) { self.rSerial = s } }
    }
    public var settings : VDDeviceSettings? {
        get { return synced(managedObjectContext) { return self.rSettings } }
        //        set(s) { synced(managedObjectContext) { self.rSettings = s } }
    }
    
    public var name : String {
        get { return synced(managedObjectContext) { return self.rName ?? "" } }
        set(n) { synced(managedObjectContext) { self.rName = n } }
    }
    public var encryptionKey : [UInt8] {
        get { return synced(managedObjectContext) { return self.rEncryptionKey?.toBytes() ?? [] } }
        set(e) { synced(managedObjectContext) { self.rEncryptionKey = NSData(bytes: e, length: e.count) } }
    }
    public var version : String {
        get { return synced(managedObjectContext) { return self.rVersion ?? "" } }
        set(v) { synced(managedObjectContext) { self.rVersion = v } }
    }
    
    public var activeDTCs : [VDDTC] {
        get { return synced(managedObjectContext) { return (self.rActiveDtcs?.allObjects as? [VDDTC]) ?? [] } }
        set(a) { synced(managedObjectContext) { self.rActiveDtcs = NSSet(array: a) } }
    }
    public var aggregates : [VDAggregate] {
        get { return synced(managedObjectContext) { return (self.rAggregates?.allObjects as? [VDAggregate]) ?? [] } }
        set(a) { synced(managedObjectContext) { self.rAggregates = NSSet(array: a) } }
    }
    public var alerts : [VDAlert] {
        get { return synced(managedObjectContext) { return (self.rAlerts?.allObjects as? [VDAlert]) ?? [] } }
        set(a) { synced(managedObjectContext) { self.rAlerts = NSSet(array: a) } }
    }
    public var avatar : VDImage? {
        get { return synced(managedObjectContext) { return self.rAvatar } }
        set(a) { synced(managedObjectContext) { self.rAvatar = a } }
    }
    public var dtcs : [VDDTC] {
        get { return synced(managedObjectContext) { return (self.rDTCs?.allObjects as? [VDDTC]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rDTCs = NSSet(array: d) } }
    }
    public var lastDailyAggregate : VDAggregate? {
        get { return synced(managedObjectContext) { return self.rLastDailyAggregate } }
        set(l) { synced(managedObjectContext) { self.rLastDailyAggregate = l } }
    }
    public var lastPoint : VDPoint? {
        get { return synced(managedObjectContext) { return self.rLastPoint } }
        set(l) { synced(managedObjectContext) { self.rLastPoint = l } }
    }
    public var lastTrip : VDTrip? {
        get { return synced(managedObjectContext) { return self.rLastTrip } }
        set(l) { synced(managedObjectContext) { self.rLastTrip = l } }
    }
    public var nextIntersection : VDIntersection? {
        get { return synced(managedObjectContext) { return self.rNextIntersection } }
        set(n) { synced(managedObjectContext) { self.rNextIntersection = n } }
    }
    public var pendingAvatar : VDImage? {
        get { return synced(managedObjectContext) { return self.rPendingAvatar } }
        set(p) { synced(managedObjectContext) { self.rPendingAvatar = p } }
    }
    public var requestsForDevice : [VDUserRequest] {
        get { return synced(managedObjectContext) { return (self.rRequestsForDevice?.allObjects as? [VDUserRequest]) ?? [] } }
        set(r) { synced(managedObjectContext) { self.rRequestsForDevice = NSSet(array: r) } }
    }
    public var settingsChanges : [VDDeviceSettingsChanges] {
        get { return synced(managedObjectContext) { return (self.rSettingChanges?.allObjects as? [VDDeviceSettingsChanges]) ?? [] } }
        set(s) { synced(managedObjectContext) { self.rSettingChanges = NSSet(array: s) } }
    }

    public var trips : [VDTrip] {
        get { return synced(managedObjectContext) { return (self.rTrips?.allObjects as? [VDTrip]) ?? [] } }
        set(t) { synced(managedObjectContext) { self.rTrips = NSSet(array: t) } }
    }
    public var userPermissions : [VDPermission] {
        get { return synced(managedObjectContext) { return (self.rUserPermissions?.allObjects as? [VDPermission]) ?? [] } }
        set(u) { synced(managedObjectContext) { self.rUserPermissions = NSSet(array: u) } }
    }
    
    public var lastLocationUpdate : NSDate { get { return synced(managedObjectContext) { return self.lastPoint?.time ?? NSDate.distantPast() } } }
    public var latitude : NSDecimalNumber { get { return synced(managedObjectContext) { return self.lastPoint?.latitude ?? 0 } } }
    public var longitude : NSDecimalNumber { get { return synced(managedObjectContext) { return self.lastPoint?.longitude ?? 0 } } }
    public var orientation : NSNumber { get { return synced(managedObjectContext) { return self.lastPoint?.orientation ?? 0 } } }
    public var nextIntersectionLatitude : NSDecimalNumber { get { return synced(managedObjectContext) { return self.nextIntersection?.latitude ?? 0 } } }
    public var nextIntersectionLongitude : NSDecimalNumber { get { return synced(managedObjectContext) { return self.nextIntersection?.longitude ?? 0 } } }
    public var nextIntersectionName : String { get { return synced(managedObjectContext) { return self.nextIntersection?.name ?? "" } } }
    public var nextIntersectionAverageStopTime : NSNumber { get { return synced(managedObjectContext) { return self.nextIntersection?.aveStopTime ?? 0 } } }
}
