//
//  VDModel.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDModel: NSManagedObject {
    public class func getModelForId(id:NSNumber, withContext: VoyoDataContext) -> VDModel? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func createModelForId(id:NSNumber, withContext: VoyoDataContext) -> VDModel {
        let model = getModelForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        model.rId = id
        return model
    }
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var name : String {
        get { return synced(managedObjectContext) { return self.rName ?? "" } }
        set(n) { synced(managedObjectContext) { self.rName = n } }
    }
    public var make : VDMake {
        get { return synced(managedObjectContext) { return self.rMake! } }
        set(m) { synced(managedObjectContext) { self.rMake = m } }
    }
    public var vehicles : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehicles?.allObjects as? [VDVehicle]) ?? [] } }
        set(v) { synced(managedObjectContext) { self.rVehicles = NSSet(array: v) } }
    }
    public var types : [VDVehicleType] {
        get { return synced(managedObjectContext) { return (self.rTypes?.allObjects as? [VDVehicleType]) ?? [] } }
        set(t) { synced(managedObjectContext) { self.rTypes = NSSet(array: t) } }
    }

}
