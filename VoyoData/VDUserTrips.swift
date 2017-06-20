//
//  VDUserTrips.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDUserTrips: NSManagedObject {
    public class func getLinkForUser(user: VDUser, toTrip: VDTrip, withContext: VoyoDataContext) -> VDUserTrips? {
        precondition(withContext.matchingContext(toTrip), "Mismatching contexts")
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rTrip = %@", toTrip),
            NSPredicate(format: "rUser = %@", user)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func linkUser(user:VDUser, toTrip: VDTrip, withContext: VoyoDataContext) -> VDUserTrips {
        precondition(withContext.matchingContext(toTrip), "Mismatching contexts")
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        let link = getLinkForUser(user, toTrip: toTrip, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        link.rTrip = toTrip
        link.rUser = user
        return link
    }
    
// Insert code here to add functionality to your managed object subclass
    public var trip : VDTrip {
        get { return synced(managedObjectContext) { return self.rTrip! } }
//        set(t) { synced(managedObjectContext) { self.rTrip = t } }
    }
    public var user : VDUser {
        get { return synced(managedObjectContext) { return self.rUser! } }
//        set(u) { synced(managedObjectContext) { self.rUser = u } }
    }
    
    public var hasBeenCleared : Bool {
        get { return synced(managedObjectContext) { return self.rHasBeenCleared?.boolValue ?? false } }
        set(c) { synced(managedObjectContext) { self.rHasBeenCleared = c } }
    }
    public var permission : Permission {
        get { return synced(managedObjectContext) { return Permission(rawValue: self.rPermission ?? 0) ?? Permission.Denied } }
        set(p) { synced(managedObjectContext) { self.rPermission = p.rawValue } }
    }
    public var present : Bool {
        get { return synced(managedObjectContext) { return self.rPresent?.boolValue ?? false } }
        set(p) { synced(managedObjectContext) { self.rPresent = p } }
    }

    public var userlastTripFor : VDUser? {
        get { return synced(managedObjectContext) { return self.rUserLastTripFor } }
        set(u) { synced(managedObjectContext) { self.rUserLastTripFor = u } }
    }
}
