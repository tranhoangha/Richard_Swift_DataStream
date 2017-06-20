//
//  VDTrip.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDTrip: NSManagedObject {
    public class func getTripForId(id: NSNumber, withContext: VoyoDataContext) -> VDTrip? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func createTripForId(id: NSNumber, withContext: VoyoDataContext) -> VDTrip {
        let trip = getTripForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        trip.rId = id
        return trip
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    
    public var co2Saved : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rCo2Saved ?? 0 } }
        set(c) { synced(managedObjectContext) { self.rCo2Saved = c } }
    }
    public var distanceDriven : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rDistanceDriven ?? 0 } }
        set(d) { synced(managedObjectContext) { self.rDistanceDriven = d } }
    }
    public var endTime : NSDate {
        get { return synced(managedObjectContext) { return self.rEndTime ?? NSDate.distantFuture() } }
        set(e) { synced(managedObjectContext) { self.rEndTime = e } }
    }
    public var fuelSaved : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rFuelSaved ?? 0 } }
        set(f) { synced(managedObjectContext) { self.rFuelSaved = f } }
    }
    public var fuelUsed : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rFuelUsed ?? 0 } }
        set(f) { synced(managedObjectContext) { self.rFuelUsed = f } }
    }
    public var hasBeenDeleted : Bool {
        get { return synced(managedObjectContext) { return self.rHasBeenDeleted?.boolValue ?? false } }
        set(d) { synced(managedObjectContext) { self.rHasBeenDeleted = d } }
    }

    public var idleTimeSaved : NSNumber {
        get { return synced(managedObjectContext) { return self.rIdleTimeSaved ?? 0 } }
        set(i) { synced(managedObjectContext) { self.rIdleTimeSaved = i } }
    }
    public var lastUpdated : NSDate {
        get { return synced(managedObjectContext) { return self.rLastUpdated ?? NSDate.distantPast() } }
        set(l) { synced(managedObjectContext) { self.rLastUpdated = l } }
    }
    public var numPoints : NSNumber {
        get { return synced(managedObjectContext) { return self.rNumPoints ?? 0 } }
        set(n) { synced(managedObjectContext) { self.rNumPoints = n } }
    }
    public var startTime : NSDate {
        get { return synced(managedObjectContext) { return self.rStartTime ?? NSDate.distantPast() } }
        set(s) { synced(managedObjectContext) { self.rStartTime = s } }
    }
    public var stopTime : NSNumber {
        get { return synced(managedObjectContext) { return self.rStopTime ?? 0 } }
        set(s) { synced(managedObjectContext) { self.rStopTime = s } }
    }
    public var timeDriven : NSNumber {
        get { return synced(managedObjectContext) { return self.rTimeDriven ?? 0 } }
        set(t) { synced(managedObjectContext) { self.rTimeDriven = t } }
    }
    
    public var alerts : [VDAlert] {
        get { return synced(managedObjectContext) { return (self.rAlerts?.allObjects as? [VDAlert]) ?? [] } }
        set(a) { synced(managedObjectContext) { self.rAlerts = NSSet(array: a) } }
    }
    public var device : VDDevice {
        get { return synced(managedObjectContext) { return self.rDevice! } }
        set(d) { synced(managedObjectContext) { self.rDevice = d } }
    }
    public var points : [VDTripPoint] {
        get { return synced(managedObjectContext) { return (self.rPoints?.allObjects as? [VDTripPoint]) ?? [] } }
        set(p) { synced(managedObjectContext) { self.rPoints = NSSet(array: p) } }
    }
    public var aggregates : [VDTripToAggregate] {
        get { return synced(managedObjectContext) { return (self.rAggregates?.allObjects as? [VDTripToAggregate]) ?? [] } }
        set(a) { synced(managedObjectContext) { self.rAggregates = NSSet(array: a) } }
    }
    public var users : [VDUserTrips] {
        get { return synced(managedObjectContext) { return (self.rUsers?.allObjects as? [VDUserTrips]) ?? [] } }
        set(u) { synced(managedObjectContext) { self.rUsers = NSSet(array: u) } }
    }
/*    public var deviceLastTripFor : VDDevice? {
        get { return synced(managedObjectContext) { return self.rDeviceLastTripFor } }
        set(d) { synced(managedObjectContext) { self.rDeviceLastTripFor = d } }
    }*/
}
