//
//  VDUserAlerts.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDUserAlerts: NSManagedObject {
    public class func getLinkForUser(user: VDUser, toAlert: VDAlert, withContext: VoyoDataContext) -> VDUserAlerts? {
        precondition(withContext.matchingContext(toAlert), "Mismatching contexts")
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rAlert = %@", toAlert),
            NSPredicate(format: "rUser = %@", user)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func linkUser(user:VDUser, toAlert:VDAlert, withContext: VoyoDataContext) -> VDUserAlerts {
        precondition(withContext.matchingContext(toAlert), "Mismatching contexts")
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        let link = getLinkForUser(user, toAlert: toAlert, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        link.rAlert = toAlert
        link.rUser = user
        return link
    }
    
// Insert code here to add functionality to your managed object subclass
    public var alert : VDAlert {
        get { return synced(managedObjectContext) { return self.rAlert! } }
//        set(a) { synced(managedObjectContext) { self.rAlert = a } }
    }
    public var user : VDUser {
        get { return synced(managedObjectContext) { return self.rUser! } }
//        set(u) { synced(managedObjectContext) { self.rUser = u } }
    }
    
    public var canView : Bool {
        get { return synced(managedObjectContext) { return self.rCanView?.boolValue ?? false } }
        set(c) { synced(managedObjectContext) { self.rCanView = c } }
    }
    public var hasBeenCleared : Bool {
        get { return synced(managedObjectContext) { return self.rHasBeenCleared?.boolValue ?? false } }
        set(h) { synced(managedObjectContext) { self.rHasBeenCleared = h } }
    }
    public var hasBeenDisplayed : Bool {
        get { return synced(managedObjectContext) { return self.rHasBeenDisplayed?.boolValue ?? false } }
        set(h) { synced(managedObjectContext) { self.rHasBeenDisplayed = h } }
    }
    public var permission : Permission {
        get { return synced(managedObjectContext) { return Permission(rawValue: self.rPermission ?? 0) ?? Permission.Denied } }
        set(p) { synced(managedObjectContext) { self.rPermission = p.rawValue } }
    }
    public var present : Bool {
        get { return synced(managedObjectContext) { return self.rPresent?.boolValue ?? false } }
        set(p) { synced(managedObjectContext) { self.rPresent = p } }
    }

}
