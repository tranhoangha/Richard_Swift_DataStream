//
//  VDPoint.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/26/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData

public class VDPoint: NSManagedObject {
    public class func getPointForId(id:NSNumber, withContext: VoyoDataContext) -> VDPoint? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func createPointForId(id:NSNumber, inTrip:VDTrip, atIndex:NSNumber, withContext:VoyoDataContext) -> VDPoint {
        let trp = VDTripPoint.createLinkForTrip(inTrip, atIndex: atIndex, withContext: withContext)
        return createPointForId(id, inTrip: trp, withContext: withContext)
    }
    public class func createPointForId(id:NSNumber, inTrip:VDTripPoint, withContext: VoyoDataContext) -> VDPoint {
        let point = getPointForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        point.rId = id
        point.rTrip = inTrip
        return point
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var trip : VDTripPoint {
        get { return synced(managedObjectContext) { return self.rTrip! } }
//        set(t) { synced(managedObjectContext) { self.rTrip = t } }
    }

    public var latitude : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rLatitude ?? 0 } }
        set(l) { synced(managedObjectContext) { self.rLatitude = l } }
    }
    public var longitude : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rLongitude ?? 0 } }
        set(l) { synced(managedObjectContext) { self.rLongitude = l } }
    }
    public var orientation : NSNumber {
        get { return synced(managedObjectContext) { return self.rOrientation ?? 0 } }
        set(o) { synced(managedObjectContext) { self.rOrientation = o } }
    }
    public var time : NSDate {
        get { return synced(managedObjectContext) { return self.rTime ?? NSDate.distantPast() } }
        set(t) { synced(managedObjectContext) { self.rTime = t } }
    }
    
/*    public var deviceLastPointFor : VDDevice? {
        get { return synced(managedObjectContext) { return self.rDeviceLastPointFor } }
        set(d) { synced(managedObjectContext) { self.rDeviceLastPointFor = d } }
    }
    public var userLastPointFor : VDUser? {
        get { return synced(managedObjectContext) { return self.rUserLastPointFor } }
        set(u) { synced(managedObjectContext) { self.rUserLastPointFor = u } }
    }*/
}
