//
//  VDUserSettingsChanges.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDUserSettingsChanges: NSManagedObject {
    public class func getChangeForSetting(setting: UserSetting, andUser: VDUser, withContext: VoyoDataContext) -> VDUserSettingsChanges? {
        precondition(withContext.matchingContext(andUser), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rDevice = %@", andUser),
            NSPredicate(format: "rSetting = %@", setting.rawValue)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func createChangeForSetting(setting: UserSetting, andUser: VDUser, withContext: VoyoDataContext) -> VDUserSettingsChanges {
        precondition(withContext.matchingContext(andUser), "Mismatching contexts")
        let change = getChangeForSetting(setting, andUser: andUser, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        change.rUser = andUser
        change.rSetting = setting.rawValue
        return change
    }
    
// Insert code here to add functionality to your managed object subclass
    public var setting : UserSetting {
        get { return synced(managedObjectContext) { return UserSetting(rawValue: self.rSetting ?? 0) ?? UserSetting.None } }
//        set(s) { synced(managedObjectContext) { self.rSetting = s.rawValue } }
    }
    public var user : VDUser {
        get { return synced(managedObjectContext) { return self.rUser! } }
//        set(u) { synced(managedObjectContext) { self.rUser = u } }
    }
    
    public var time : NSDate {
        get { return synced(managedObjectContext) { return self.rTime ?? NSDate.distantPast() } }
        set(t) { synced(managedObjectContext) { self.rTime = t } }
    }
    public var value : [UInt8] {
        get { return synced(managedObjectContext) { return self.rValue?.toBytes() ?? [] } }
        set(v) { synced(managedObjectContext) { self.rValue = NSData(bytes: v, length: v.count)  } }
    }

    
}
