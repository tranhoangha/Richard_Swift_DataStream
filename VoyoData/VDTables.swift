//
//  VDTables.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDTables: NSManagedObject {
    public class func getTableForAccount(account:VDUser, withId:NSNumber, withContext: VoyoDataContext) -> VDTables? {
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rTableId = %@", withId),
            NSPredicate(format: "rAccount = %@", account)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func createTableForAccount(account:VDUser, withId:NSNumber, withContext: VoyoDataContext) -> VDTables {
        let table = getTableForAccount(account, withId: withId, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        table.rTableId = withId
        table.rAccount = account
        return table
    }
    
// Insert code here to add functionality to your managed object subclass
    public var tableId : NSNumber {
        get { return synced(managedObjectContext) { return self.rTableId ?? 0 } }
//        set(t) { synced(managedObjectContext) { self.rTableId = t } }
    }
    public var account : VDUser {
        get { return synced(managedObjectContext) { return self.rAccount! } }
//        set(a) { synced(managedObjectContext) { self.rAccount = a } }
    }
    public var lastUpdated : NSDate {
        get { return synced(managedObjectContext) { return self.rLastUpdated ?? NSDate.distantPast() } }
        set(l) { synced(managedObjectContext) { self.rLastUpdated = l } }
    }
}
