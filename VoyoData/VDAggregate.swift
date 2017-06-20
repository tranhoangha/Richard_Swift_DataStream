//
//  VDAggregate.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDAggregate: NSManagedObject {
    public class func getAggregateForId(id: NSNumber, owner:VDUser, withContext: VoyoDataContext) -> VDAggregate? {
        precondition(withContext.matchingContext(owner), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rId = %@", id),
            NSPredicate(format: "rAggUser = %@", owner)
            ])
        return withContext.executeFetchRequest(request).first
    }
    private class func getDeviceAggregateForId(id:NSNumber, type: AggregateType, device: VDDevice, startTime : NSDate, endTime:NSDate, owner:VDUser, withContext: VoyoDataContext) -> VDAggregate? {
        precondition(withContext.matchingContext(device), "Mismatching contexts")
        precondition(withContext.matchingContext(owner), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rType = %@", type.rawValue),
            NSPredicate(format: "rDevice = %@", device),
            NSPredicate(format: "startTime = %@", startTime),
            NSPredicate(format: "endTime = %@", endTime),
            NSPredicate(format: "rAggUser = %@", owner)
            ])
        return withContext.executeFetchRequest(request).first
    }
    private class func getUserAggregateForId(id:NSNumber, type: AggregateType, user: VDUser, startTime : NSDate, endTime:NSDate, owner:VDUser, withContext: VoyoDataContext) -> VDAggregate? {
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        precondition(withContext.matchingContext(owner), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rType = %@", type.rawValue),
            NSPredicate(format: "rUser = %@", user),
            NSPredicate(format: "startTime = %@", startTime),
            NSPredicate(format: "endTime = %@", endTime),
            NSPredicate(format: "rAggUser = %@", owner)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func createDeviceAggregateForId(id: NSNumber, type: AggregateType, device: VDDevice, startTime : NSDate, endTime:NSDate, owner:VDUser, withContext: VoyoDataContext) -> VDAggregate {
        let aggregate = getAggregateForId(id, owner: owner, withContext: withContext) ??
            getDeviceAggregateForId(id, type: type, device: device, startTime: startTime, endTime: endTime, owner: owner, withContext: withContext) ??
            withContext.insertNewObjectForEntityForType(self)
        aggregate.rId = id
        aggregate.rType = type.rawValue
        aggregate.rDevice = device
        aggregate.rStartTime = startTime
        aggregate.rEndTime = endTime
        return aggregate
    }
    public class func createUserAggregateForId(id: NSNumber, type: AggregateType, user: VDUser, startTime : NSDate, endTime:NSDate, owner:VDUser, withContext: VoyoDataContext) -> VDAggregate {
        let aggregate = getAggregateForId(id, owner: owner, withContext: withContext) ??
            getUserAggregateForId(id, type: type, user: user, startTime: startTime, endTime: endTime, owner: owner, withContext: withContext) ??
            withContext.insertNewObjectForEntityForType(self)
        aggregate.rId = id
        aggregate.rType = type.rawValue
        aggregate.rUser = user
        aggregate.rStartTime = startTime
        aggregate.rEndTime = endTime
        aggregate.rAggUser = owner
        return aggregate
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var type : AggregateType {
        get { return synced(managedObjectContext) { return AggregateType(rawValue: self.rType ?? 0) ?? AggregateType.Day } }
//        set(t) { synced(managedObjectContext) { self.rType = t.rawValue } }
    }

    public var startTime : NSDate {
        get { return synced(managedObjectContext) { return self.rStartTime ?? NSDate.distantPast() } }
//        set(s) { synced(managedObjectContext) { self.rStartTime = s } }
    }
    public var endTime : NSDate {
        get { return synced(managedObjectContext) { return self.rEndTime ?? NSDate.distantFuture() } }
//        set(e) { synced(managedObjectContext) { self.rEndTime = e } }
    }
    public var user : VDUser? {
        get { return synced(managedObjectContext) { return self.rUser } }
//        set(u) { synced(managedObjectContext) { self.rUser = u } }
    }
    public var device : VDDevice? {
        get { return synced(managedObjectContext) { return self.rDevice } }
//        set(d) { synced(managedObjectContext) { self.rDevice = d } }
    }
    public var aggregateUser : VDUser {
        get { return synced(managedObjectContext) { return self.rAggUser! } }
//        set(a) { synced(managedObjectContext) { self.rAggUser = a } }
    }
    public var alerts : [VDAlertToAggregate] {
        get { return synced(managedObjectContext) { return (self.rAlerts?.allObjects as? [VDAlertToAggregate]) ?? [] } }
        //        set(a) { synced(managedObjectContext) { self.rAlerts = NSSet(array: a) } }
    }
    
    public var co2Saved : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rCo2Saved ?? 0 } }
        set(c) { synced(managedObjectContext) { self.rCo2Saved = c } }
    }
    public var distance : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rDistance ?? 0 } }
        set(d) { synced(managedObjectContext) { self.rDistance = d } }
    }
    public var driveTime : NSNumber {
        get { return synced(managedObjectContext) { return self.rDriveTime ?? 0 } }
        set(d) { synced(managedObjectContext) { self.rDriveTime = d } }
    }
    public var fuelSaved : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rFuelSaved ?? 0 } }
        set(f) { synced(managedObjectContext) { self.rFuelSaved = f } }
    }
    public var fuelUsed : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rFuelUsed ?? 0 } }
        set(f) { synced(managedObjectContext) { self.rFuelUsed = f } }
    }
    public var idleTimeSaved : NSNumber {
        get { return synced(managedObjectContext) { return self.rIdleTimeSaved ?? 0 } }
        set(i) { synced(managedObjectContext) { self.rIdleTimeSaved = i } }
    }
    public var numEvents : NSNumber {
        get { return synced(managedObjectContext) { return self.rNumEvents ?? 0 } }
        set(n) { synced(managedObjectContext) { self.rNumEvents = n } }
    }
    public var numTrips : NSNumber {
        get { return synced(managedObjectContext) { return self.rNumTrips ?? 0 } }
        set(n) { synced(managedObjectContext) { self.rNumTrips = n } }
    }
    public var stopTime : NSNumber {
        get { return synced(managedObjectContext) { return self.rTimeStopped ?? 0 } }
        set(s) { synced(managedObjectContext) { self.rTimeStopped = s } }
    }
    
    public var trips : [VDTripToAggregate] {
        get { return synced(managedObjectContext) { return (self.rTrips?.allObjects as? [VDTripToAggregate]) ?? [] } }
        set(t) { synced(managedObjectContext) { self.rTrips = NSSet(array: t) } }
    }
/*    public var forDevice : Bool {
        get { return synced(managedObjectContext) { return self.rForDevice?.boolValue ?? false } }
        set(d) { synced(managedObjectContext) { self.rForDevice = d } }
    }*/

/*    public var linkedId : NSNumber {
        get { return synced(managedObjectContext) { return self.rLinkedId ?? 0 } }
        set(l) { synced(managedObjectContext) { self.rLinkedId = l } }
    }*/

    
/*    public var deviceLastAggregateFor : VDDevice? {
        get { return synced(managedObjectContext) { return self.rDeviceLastAggregateFor } }
        set(d) { synced(managedObjectContext) { self.rDeviceLastAggregateFor = d } }
     }*/
/*    public var userLastAggregateFor : VDUser? {
        get { return synced(managedObjectContext) { return self.rUserLastAggregateFor } }
        set(u) { synced(managedObjectContext) { self.rUserLastAggregateFor = u } }
    }*/
}
