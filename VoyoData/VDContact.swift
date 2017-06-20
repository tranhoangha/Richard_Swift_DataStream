//
//  VDContact.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/25/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDContact: NSManagedObject {
    public class func getContactForId(id: NSNumber, andUser: VDUser, withContext: VoyoDataContext) -> VDContact? {
        precondition(withContext.matchingContext(andUser), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rUser = %@", andUser),
            NSPredicate(format: "rId = %@", id)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func createContactForId(id: NSNumber, andUser: VDUser, withContext: VoyoDataContext) -> VDContact {
        precondition(withContext.matchingContext(andUser), "Mismatching contexts")
        let contact = getContactForId(id, andUser: andUser, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        contact.rId = id
        contact.rUser = andUser
        return contact
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var user : VDUser {
        get { return synced(managedObjectContext) { return self.rUser! } }
//        set(u) { synced(managedObjectContext) { self.rUser = u } }
    }
    
    public var firstName : String {
        get { return synced(managedObjectContext) { return self.rFirstName ?? "" } }
        set(f) { synced(managedObjectContext) { self.rFirstName = f } }
    }
    public var lastName : String {
        get { return synced(managedObjectContext) { return self.rLastName ?? "" } }
        set(l) { synced(managedObjectContext) { self.rLastName = l } }
    }
    public var email : String? {
        get { return synced(managedObjectContext) { return self.rEmail } }
        set(e) { synced(managedObjectContext) { self.rEmail = e } }
    }
    public var phonenumber : String? {
        get { return synced(managedObjectContext) { return self.rPhoneNumber } }
        set(p) { synced(managedObjectContext) { self.rPhoneNumber = p } }
    }


}
