//
//  VDAlertToAggregate.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDAlertToAggregate: NSManagedObject {
    public class func getLinkForAggregate(aggregate: VDAggregate, atIndex: NSNumber, withContext: VoyoDataContext) -> VDAlertToAggregate? {
        precondition(withContext.matchingContext(aggregate), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rAggregate = %@", aggregate),
            NSPredicate(format: "rIndex = %@", atIndex)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func linkAlert(alert:VDAlert, toAggregate:VDAggregate, atIndex: NSNumber, withContext: VoyoDataContext) -> VDAlertToAggregate {
        precondition(withContext.matchingContext(toAggregate), "Mismatching contexts")
        precondition(withContext.matchingContext(alert), "Mismatching contexts")
        let link = getLinkForAggregate(toAggregate, atIndex: atIndex, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        link.rAggregate = toAggregate
        link.rIndex = atIndex
        link.rAlert = alert
        return link
    }
    
// Insert code here to add functionality to your managed object subclass
    public var index : NSNumber {
        get { return synced(managedObjectContext) { return self.rIndex ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rIndex = i } }
    }
    public var aggregate : VDAggregate {
        get { return synced(managedObjectContext) { return self.rAggregate! } }
//        set(a) { synced(managedObjectContext) { self.rAggregate = a } }
    }
    public var alert : VDAlert {
        get { return synced(managedObjectContext) { return self.rAlert! } }
        set(a) { synced(managedObjectContext) { self.rAlert = a } }
    }
}
