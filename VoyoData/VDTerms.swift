//
//  VDTerms.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDTerms: NSManagedObject {
    public class func getTermsForId(id:NSNumber, withContext: VoyoDataContext) -> VDTerms? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func createTermsForId(id:NSNumber, withText:String, withContext: VoyoDataContext) -> VDTerms {
        let terms = getTermsForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        terms.rId = id
        terms.rTerms = withText
        return terms
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var terms : String {
        get { return synced(managedObjectContext) { return self.rTerms ?? "" } }
//        set(t) { synced(managedObjectContext) { self.rTerms = t } }
    }
/*    public var userAccepted : [VDUser] {
        get { return synced(managedObjectContext) { return (self.rUsersAccepted?.allObjects as? [VDUser]) ?? [] } }
        set(u) { synced(managedObjectContext) { self.rUsersAccepted = NSSet(array: u) } }
    }*/
}
