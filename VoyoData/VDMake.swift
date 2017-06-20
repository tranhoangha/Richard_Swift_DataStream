//
//  VDMake.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDMake: NSManagedObject {
    public class func getAllMakes(withContext: VoyoDataContext) -> [VDMake] {
        let request = FetchRequest(type: self)
        return withContext.executeFetchRequest(request)
    }
    public class func getMakeForId(id:NSNumber, withContext: VoyoDataContext) -> VDMake? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func getMakeForName(name:String, withContext: VoyoDataContext) -> VDMake? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rName = %@", name)
        return withContext.executeFetchRequest(request).first
    }
    public class func createMakeForId(id:NSNumber, withContext: VoyoDataContext) -> VDMake {
        let make = getMakeForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        make.rId = id
        return make
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var name : String {
        get { return synced(managedObjectContext) { return self.rName ?? "" } }
        set(n) { synced(managedObjectContext) { self.rName = n } }
    }
    public var models : [VDModel] {
        get { return synced(managedObjectContext) { return (self.rModels?.allObjects as? [VDModel]) ?? [] } }
        set(m) { synced(managedObjectContext) { self.rModels = NSSet(array: m) } }
    }
    public var vehicles : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehicles?.allObjects as? [VDVehicle]) ?? [] } }
        set(v) { synced(managedObjectContext) { self.rVehicles = NSSet(array: v) } }
    }
}
