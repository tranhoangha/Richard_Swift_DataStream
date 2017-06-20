//
//  VDDeviceSettingsChanges.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDDeviceSettingsChanges: NSManagedObject {
    public class func getChangeForSetting(setting: DeviceSetting, andDevice: VDDevice, withContext: VoyoDataContext) -> VDDeviceSettingsChanges? {
        precondition(withContext.matchingContext(andDevice), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rDevice = %@", andDevice),
            NSPredicate(format: "rSetting = %@", setting.rawValue)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func createChangeForSetting(setting: DeviceSetting, andDevice: VDDevice, withContext: VoyoDataContext) -> VDDeviceSettingsChanges {
        precondition(withContext.matchingContext(andDevice), "Mismatching contexts")
        let change = getChangeForSetting(setting, andDevice: andDevice, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        change.rDevice = andDevice
        change.rSetting = setting.rawValue
        return change
    }
    
// Insert code here to add functionality to your managed object subclass
    public var setting : DeviceSetting {
        get { return synced(managedObjectContext) { return DeviceSetting(rawValue: self.rSetting ?? 0) ?? DeviceSetting.AutoKeyAllowed } }
//        set(s) { synced(managedObjectContext) { self.rSetting = s.rawValue } }
    }
    public var device : VDDevice {
        get { return synced(managedObjectContext) { return self.rDevice! } }
//        set(d) { synced(managedObjectContext) { self.rDevice = d } }
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
