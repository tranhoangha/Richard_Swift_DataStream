//
//  VDTripPoint.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/28/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDTripPoint: NSManagedObject {
    public class func getPointForIndex(index:NSNumber, inTrip:VDTrip, withContext: VoyoDataContext) -> VDTripPoint? {
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rIndex = %@", index),
            NSPredicate(format: "rTrip = %@", inTrip)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func createLinkForTrip(trip:VDTrip, atIndex:NSNumber, withContext:VoyoDataContext) -> VDTripPoint {
        let trp = getPointForIndex(atIndex, inTrip: trip, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        trp.rIndex = atIndex
        trp.rTrip = trip
        return trp
    }
    
    
// Insert code here to add functionality to your managed object subclass
    public var index : NSNumber {
        get { return synced(managedObjectContext) { return self.rIndex ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rIndex = i } }
    }
    public var trip : VDTrip {
        get { return synced(managedObjectContext) { return self.rTrip! } }
//        set(t) { synced(managedObjectContext) { self.rTrip = t } }
    }
    public var point : VDPoint {
        get { return synced(managedObjectContext) { return self.rPoint! } }
        set(p) { synced(managedObjectContext) { self.rPoint = p } }
    }
}
