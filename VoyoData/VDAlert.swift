//
//  VDAlert.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDAlert: NSManagedObject {
    public class func getAlertForId(id: NSNumber, withContext: VoyoDataContext) -> VDAlert? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func createAlertForId(id: NSNumber, withContext: VoyoDataContext) -> VDAlert {
        let alert = getAlertForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        alert.rId = id
        return alert
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    
    public var active : Bool {
        get { return synced(managedObjectContext) { return self.rActive?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rActive = a } }
    }
    public var endTime : NSDate {
        get { return synced(managedObjectContext) { return self.rEnd ?? NSDate.distantFuture() } }
        set(e) { synced(managedObjectContext) { self.rEnd = e } }
    }
    public var hasBeenDeleted : Bool {
        get { return synced(managedObjectContext) { return self.rHasBeenDeleted?.boolValue ?? false } }
        set(d) { synced(managedObjectContext) { self.rHasBeenDeleted = d } }
    }
    public var icon : AlertIcon {
        get { return synced(managedObjectContext) { return AlertIcon(rawValue: self.rIcon ?? 0) ?? AlertIcon.Exclamation } }
        set(i) { synced(managedObjectContext) { self.rIcon = i.rawValue } }
    }

    public var latitude : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rLatitude ?? 0 } }
        set(l) { synced(managedObjectContext) { self.rLatitude = l } }
    }
    public var longDescription : String {
        get { return synced(managedObjectContext) { return self.rLongDescription ?? "" } }
        set(d) { synced(managedObjectContext) { self.rLongDescription = d } }
    }
    public var longitude : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rLongitude ?? 0 } }
        set(l) { synced(managedObjectContext) { self.rLongitude = l } }
    }
    public var name : String {
        get { return synced(managedObjectContext) { return self.rName ?? "" } }
        set(n) { synced(managedObjectContext) { self.rName = n } }
    }
    public var severity : AlertSeverity {
        get { return synced(managedObjectContext) { return AlertSeverity(rawValue: self.rSeverity ?? 0) ?? AlertSeverity.Info } }
        set(s) { synced(managedObjectContext) { self.rSeverity = s.rawValue } }
    }
    public var shortDescription : String {
        get { return synced(managedObjectContext) { return self.rShortDescription ?? "" } }
        set(d) { synced(managedObjectContext) { self.rShortDescription = d } }
    }
    public var startTime : NSDate {
        get { return synced(managedObjectContext) { return self.rStart ?? NSDate.distantPast() } }
        set(s) { synced(managedObjectContext) { self.startTime = s } }
    }
    public var type : AlertType {
        get { return synced(managedObjectContext) { return AlertType(rawValue: self.rType ?? 0) ?? AlertType.Behavior } }
        set(t) { synced(managedObjectContext) { self.rType = t.rawValue } }
    }
    
    public var aggregates : [VDAlertToAggregate] {
        get { return synced(managedObjectContext) { return (self.rAggregates?.allObjects as? [VDAlertToAggregate]) ?? [] } }
        set(a) { synced(managedObjectContext) { self.rAggregates = NSSet(array: a) } }
    }
    public var device : VDDevice {
        get { return synced(managedObjectContext) { return self.rDevice! } }
        set(d) { synced(managedObjectContext) { self.rDevice = d } }
    }
    public var trip : VDTrip? {
        get { return synced(managedObjectContext) { return self.rTrip } }
        set(t) { synced(managedObjectContext) { self.rTrip = t } }
    }
    public var users : [VDUserAlerts] {
        get { return synced(managedObjectContext) { return (self.rUsers?.allObjects as? [VDUserAlerts]) ?? [] } }
        set(u) { synced(managedObjectContext) { self.rUsers = NSSet(array: u) } }
    }
    public var vehicle : VDVehicle? {
        get { return synced(managedObjectContext) { return self.rVehicle } }
        set(v) { synced(managedObjectContext) { self.rVehicle = v } }
    }
}
