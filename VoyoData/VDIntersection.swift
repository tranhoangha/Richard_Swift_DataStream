//
//  VDIntersection.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/26/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDIntersection: NSManagedObject {
    public class func setNextIntersectionForDevice(device:VDDevice, atLatitude:NSDecimalNumber, andLongitude:NSDecimalNumber, withName:String, andAverageStopTime:NSNumber, withContext: VoyoDataContext) -> VDIntersection {
        precondition(withContext.matchingContext(device), "Mismatching contexts")
        let intersection = device.nextIntersection ?? withContext.insertNewObjectForEntityForType(self)
        intersection.rAveStopTime = andAverageStopTime
        intersection.rLatitude = atLatitude
        intersection.rLongitude = andLongitude
        intersection.rName = withName
        device.nextIntersection = intersection
        return intersection
    }
    
// Insert code here to add functionality to your managed object subclass
    public var aveStopTime : NSNumber {
        get { return synced(managedObjectContext) { return self.rAveStopTime ?? 0 } }
//        set(a) { synced(managedObjectContext) { self.rAveStopTime = a } }
    }
    public var latitude : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rLatitude ?? 0 } }
//        set(l) { synced(managedObjectContext) { self.rLatitude = l } }
    }
    public var longitude : NSDecimalNumber {
        get { return synced(managedObjectContext) { return self.rLongitude ?? 0 } }
//        set(l) { synced(managedObjectContext) { self.rLongitude = l } }
    }
    public var name : String {
        get { return synced(managedObjectContext) { return self.rName ?? "" } }
//        set(n) { synced(managedObjectContext) { self.rName = n } }
    }
    
    public var devicesNextIntersectionFor : [VDDevice] {
        get { return synced(managedObjectContext) { return (self.rDevicesNextIntersectionFor?.allObjects as? [VDDevice]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rDevicesNextIntersectionFor = NSSet(array: d) } }
    }
}
