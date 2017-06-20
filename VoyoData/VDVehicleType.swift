//
//  VDVehicleType.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDVehicleType: NSManagedObject {
    public class func getVehicleForId(id: NSNumber, withContext: VoyoDataContext) -> VDVehicleType? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func createVehicleForId(id: NSNumber, withContext: VoyoDataContext) -> VDVehicleType {
        let vehicle = getVehicleForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        vehicle.rId = id
        return vehicle
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var maxYear : NSNumber {
        get { return synced(managedObjectContext) { return self.rMaxYear ?? 0 } }
        set(m) { synced(managedObjectContext) { self.rMaxYear = m } }
    }
    public var minYear : NSNumber {
        get { return synced(managedObjectContext) { return self.rMinYear ?? 0 } }
        set(m) { synced(managedObjectContext) { self.rMinYear = m } }
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
    public var model : VDModel {
        get { return synced(managedObjectContext) { return self.rModel! } }
        set(m) { synced(managedObjectContext) { self.rModel = m } }
    }
}
