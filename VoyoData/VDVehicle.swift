//
//  VDVehicle.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDVehicle: NSManagedObject {
    public class func getVehicleForVid(vid: NSNumber, withContext: VoyoDataContext) -> VDVehicle? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rVid = %@", vid)
        return withContext.executeFetchRequest(request).first
    }
    public class func getVehicleForVIN(vin: String, withContext: VoyoDataContext) -> VDVehicle? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rVIN = %@", vin)
        return withContext.executeFetchRequest(request).first
    }
    public class func createVehicleForVid(vid: NSNumber, andVIN:String, withContext: VoyoDataContext) -> VDVehicle {
        let vehicle = getVehicleForVid(vid, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        vehicle.rVid = vid
        vehicle.rVIN = andVIN
        return vehicle
    }
    
// Insert code here to add functionality to your managed object subclass
    public var vid : NSNumber {
        get { return synced(managedObjectContext) { return self.rVid ?? 0 } }
//        set(v) { synced(managedObjectContext) { self.rVid = v } }
    }
    public var vin : String {
        get { return synced(managedObjectContext) { return self.rVIN ?? "" } }
//        set(v) { synced(managedObjectContext) { self.rVIN = v } }
    }
    
    public var name : String {
        get { return synced(managedObjectContext) { return self.rName ?? "" } }
        set(n) { synced(managedObjectContext) { self.rName = n } }
    }

    public var year : NSNumber {
        get { return synced(managedObjectContext) { return self.rYear ?? 0 } }
        set(y) { synced(managedObjectContext) { self.rYear = y } }
    }
    
    public var alerts : [VDAlert] {
        get { return synced(managedObjectContext) { return (self.rAlerts?.allObjects as? [VDAlert]) ?? [] } }
        set(a) { synced(managedObjectContext) { self.rAlerts = NSSet(array: a) } }
    }
    public var fuseImage : VDImage? {
        get { return synced(managedObjectContext) { return self.rFuseImage } }
        set(f) { synced(managedObjectContext) { self.rFuseImage = f } }
    }
    public var obdImage : VDImage? {
        get { return synced(managedObjectContext) { return self.rOBDImage } }
        set(o) { synced(managedObjectContext) { self.rOBDImage = o } }
    }
    public var postImmobilizationImage : VDImage? {
        get { return synced(managedObjectContext) { return self.rPostImmobImage } }
        set(p) { synced(managedObjectContext) { self.rPostImmobImage = p } }
    }
    public var postStopAtParkImage : VDImage? {
        get { return synced(managedObjectContext) { return self.rPostSAPImage } }
        set(p) { synced(managedObjectContext) { self.rPostSAPImage = p } }
    }
    public var postStopStartImage : VDImage? {
        get { return synced(managedObjectContext) { return self.rPostSSImage } }
        set(p) { synced(managedObjectContext) { self.rPostSSImage = p } }
    }
    public var preImmobilizationImage : VDImage? {
        get { return synced(managedObjectContext) { return self.rPreImmobImage } }
        set(p) { synced(managedObjectContext) { self.rPreImmobImage = p } }
    }
    public var preStopAtParkImage : VDImage? {
        get { return synced(managedObjectContext) { return self.rPreSAPImage } }
        set(p) { synced(managedObjectContext) { self.rPreSAPImage = p } }
    }
    public var preStopStartImage : VDImage? {
        get { return synced(managedObjectContext) { return self.rPreSSImage } }
        set(p) { synced(managedObjectContext) { self.rPreSSImage = p } }
    }
    public var make : VDMake {
        get { return synced(managedObjectContext) { return self.rMake! } }
        set(m) { synced(managedObjectContext) { self.rMake = m } }
    }
    public var model : VDModel {
        get { return synced(managedObjectContext) { return self.rModel! } }
        set(m) { synced(managedObjectContext) { self.rModel = m } }
    }
}
