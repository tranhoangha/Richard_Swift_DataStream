//
//  VDPermission.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDPermission: NSManagedObject {
    public class func getLinkBetweenUser(user: VDUser, andDevice: VDDevice, withContext: VoyoDataContext) -> VDPermission? {
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        precondition(withContext.matchingContext(andDevice), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rUser = %@", user),
            NSPredicate(format: "rDevice = %@", andDevice)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func linkUser(user: VDUser, andDevice: VDDevice, withPermission: Permission, withContext: VoyoDataContext) -> VDPermission {
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        precondition(withContext.matchingContext(andDevice), "Mismatching contexts")
        let link = getLinkBetweenUser(user, andDevice: andDevice, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        link.rUser = user
        link.rDevice = andDevice
        link.permission = withPermission
        return link
    }
    
    
// Insert code here to add functionality to your managed object subclass
    public var device : VDDevice {
        get { return synced(managedObjectContext) { return self.rDevice! } }
        //        set(d) { synced(managedObjectContext) { self.rDevice = d } }
    }
    public var user : VDUser {
        get { return synced(managedObjectContext) { return self.rUser! } }
        //        set(u) { synced(managedObjectContext) { self.rUser = u } }
    }

    public var permission : Permission {
        get { return synced(managedObjectContext) { return Permission(rawValue: self.rPermission ?? 0) ?? Permission.Denied } }
        set(p) { synced(managedObjectContext) { self.rPermission = p.rawValue } }
    }
    
}
