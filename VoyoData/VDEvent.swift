//
//  VDEvent.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDEvent: NSManagedObject {
    public class func getEventForId(id: NSNumber, withContext: VoyoDataContext) -> VDEvent? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func getUnreportedEventsWithLimit(limit:Int, withContext: VoyoDataContext) -> [VDEvent] {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rServerStatus = %@", EventStatus.ToReport.rawValue)
        request.limit = limit
        return withContext.executeFetchRequest(request)
    }
    public class func getReportedEventsInArea(area:CoordinateRectangle, withLimit:Int, withContext: VoyoDataContext) -> [VDEvent] {
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rLatitude <= %f", area.upperLeft.latitude),
            NSPredicate(format: "rLongitude >= %f", area.upperLeft.longitude),
            NSPredicate(format: "rLatitude >= %f", area.lowerRight.latitude),
            NSPredicate(format: "rLongitude <= %f", area.lowerRight.longitude),
            NSPredicate(format: "rServerStatus = %@", EventStatus.FromServer.rawValue)
            ])
        request.sortDescriptor = NSSortDescriptor(key: "rDate", ascending: false)
        request.limit = withLimit
        return withContext.executeFetchRequest(request)
    }
    public class func reportEventbyUser(user:VDUser, atLatitude:NSDecimalNumber, andLongitude:NSDecimalNumber, withType:EventType, andSeverity:AlertSeverity, atTime:NSDate, withContext: VoyoDataContext) -> VDEvent {
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        let event = withContext.insertNewObjectForEntityForType(self)
        event.rReporter = user
        event.rLatitude = atLatitude
        event.rLongitude = andLongitude
        event.rType = withType.rawValue
        event.rSeverity = andSeverity.rawValue
        event.rDate = atTime
        event.rServerStatus = EventStatus.ToReport.rawValue
        return event
    }
    public class func createEventWithId(id: NSNumber, atLatitude:NSDecimalNumber, andLongitude:NSDecimalNumber, withType:EventType, andSeverity:AlertSeverity, atTime:NSDate, withContext: VoyoDataContext) -> VDEvent {
        let event = getEventForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        event.rId = id
        event.rLatitude = atLatitude
        event.rLongitude = andLongitude
        event.rType = withType.rawValue
        event.rSeverity = andSeverity.rawValue
        event.rDate = atTime
        event.rServerStatus = EventStatus.ToReport.rawValue
        return event
    }
    
    
// Insert code here to add functionality to your managed object subclass
    public var date : NSDate {
        get { return synced(managedObjectContext) { return self.rDate ?? NSDate.distantPast() } }
//        set(d) { synced(managedObjectContext) { self.rDate = d } }
    }
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var latitude : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rLatitude ?? 0 } }
//        set(l) { synced(managedObjectContext) { self.rLatitude = l } }
    }
    public var longitude : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rLongitude ?? 0 } }
//        set(l) { synced(managedObjectContext) { self.rLongitude = l } }
    }
    public var type : EventType {
        get { return synced(managedObjectContext) { return EventType(rawValue: self.rType ?? 2) ?? EventType.Hazard } }
//        set(t) { synced(managedObjectContext) { self.rType = t.rawValue } }
    }
    public var severity : AlertSeverity {
        get { return synced(managedObjectContext) { return AlertSeverity(rawValue: self.rSeverity ?? 0) ?? AlertSeverity.Info } }
//        set(s) { synced(managedObjectContext) { self.rSeverity = s.rawValue } }
    }
    public var reporter : VDUser? {
        get { return synced(managedObjectContext) { return self.rReporter } }
    }
    
    public var status : EventStatus {
        get { return synced(managedObjectContext) { return EventStatus(rawValue: self.rServerStatus ?? 0) ?? EventStatus.FromServer } }
        set(s) { synced(managedObjectContext) { self.rServerStatus = s.rawValue } }
    }
}
