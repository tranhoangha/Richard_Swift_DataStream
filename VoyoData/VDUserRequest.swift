//
//  VDUserRequest.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/26/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDUserRequest: NSManagedObject {
    public class func getUserRequestForId(id: NSNumber, withContext: VoyoDataContext) -> VDUserRequest? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func getRequestFromUser(requester:VDUser, toUser:VDUser, withContext: VoyoDataContext) -> VDUserRequest? {
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rRequester = %@", requester),
            NSPredicate(format: "rUser = %@", toUser)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func addRequestWithId(id: NSNumber, fromUser:VDUser, toUser:VDUser, withContext: VoyoDataContext) -> VDUserRequest {
        precondition(withContext.matchingContext(fromUser), "Mismatching contexts")
        precondition(withContext.matchingContext(toUser), "Mismatching contexts")
        let request = getUserRequestForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        request.rId = id
        request.rRequester = fromUser
        request.rUser = toUser
        return request
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var requester : VDUser {
        get { return synced(managedObjectContext) { return self.rRequester! } }
//        set(r) { synced(managedObjectContext) { self.rRequester = r } }
    }
    public var user : VDUser {
        get { return synced(managedObjectContext) { return self.rUser! } }
//        set(u) { synced(managedObjectContext) { self.rUser = u } }
    }
    
    public var permission : Permission {
        get { return synced(managedObjectContext) { return Permission(rawValue: self.rPermission ?? 0) ?? Permission.Denied } }
        set(p) { synced(managedObjectContext) { self.rPermission = p.rawValue } }
    }
    public var status : RequestStatus {
        get{ return synced(managedObjectContext) { return RequestStatus(rawValue: self.rStatus ?? 0) ?? RequestStatus.New } }
        set(s) { synced(managedObjectContext) { self.rStatus = s.rawValue } }
    }
    public var type : RequestType {
        get{ return synced(managedObjectContext) { return RequestType(rawValue: self.rType ?? 0) ?? RequestType.Invite } }
        set(t) { synced(managedObjectContext) { self.rType = t.rawValue } }
    }
    public var device : VDDevice? {
        get{ return synced(managedObjectContext) { return self.rDevice } }
        set(d) { synced(managedObjectContext) { self.rDevice = d } }
    }


}
