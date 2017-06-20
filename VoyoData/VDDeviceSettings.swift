//
//  VDDeviceSettings.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDDeviceSettings: NSManagedObject {
    public class func getSettingsForDevice(device: VDDevice, withContext: VoyoDataContext) -> VDDeviceSettings? {
        precondition(withContext.matchingContext(device), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rDevice = %@", device)
        return withContext.executeFetchRequest(request).first
    }
    public class func createSettingsForDevice(device: VDDevice, withContext: VoyoDataContext) -> VDDeviceSettings {
        precondition(withContext.matchingContext(device), "Mismatching contexts")
        let settings = getSettingsForDevice(device, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        settings.rDevice = device
        return settings
    }
    
// Insert code here to add functionality to your managed object subclass
    public var device : VDDevice {
        get { return synced(managedObjectContext) { return self.rDevice! } }
//        set(d) { synced(managedObjectContext) { self.rDevice = d } }
    }

    public var autoKeyAllowed : Bool {
        get { return synced(managedObjectContext) { return self.rAutoKeyAllowed?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rAutoKeyAllowed =  a } }
    }
    public var autoStopEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rAutoStopEnabled?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rAutoStopEnabled = a } }
    }
    public var autoStopTime : NSNumber {
        get { return synced(managedObjectContext) { return self.rAutoStopTime ?? 0 } }
        set(a) { synced(managedObjectContext) { self.rAutoStopTime = a } }
    }
    public var driverDoorOnly : Bool {
        get { return synced(managedObjectContext) { return self.rDriverDoorOnly?.boolValue ?? false } }
        set(d) { synced(managedObjectContext) { self.rDriverDoorOnly = d } }
    }
    public var immobilizerEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rImmobilizerEnabled?.boolValue ?? false } }
        set(i) { synced(managedObjectContext) { self.rImmobilizerEnabled = i } }
    }
    public var immobilizationTimes : [(Int,Int)] {
        get {
            if let data = (synced(managedObjectContext) { return self.rImmobTimes?.toBytes() }) {
                let reader = ByteReader(data: data)
                let numtimes = Int(reader.readUInt8())
                var rval : [(Int,Int)] = []
                for _ in 0 ..< numtimes {
                    let start = reader.readUInt32()
                    let end = reader.readUInt32()
                    rval.append((Int(start),Int(end)))
                }
                return rval
            }
            return []
        }
        set(t) {
            let writer = ByteWriter()
            writer.write(UInt8(t.count))
            for (start,end) in t {
                writer.write(UInt32(start))
                writer.write(UInt32(end))
            }
            synced(managedObjectContext) { self.rImmobTimes = writer.getData() }
        }
    }
    public var keylessEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rKeylessEnabled?.boolValue ?? false } }
        set(k) { synced(managedObjectContext) { self.rKeylessEnabled = k } }
    }
    public var mobilizeOnProximityEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rMobilizeOnProximityEnabled?.boolValue ?? false } }
        set(m) { synced(managedObjectContext) { self.rMobilizeOnProximityEnabled = m } }
    }
    public var privacySettings : PrivacySetting {
        get { return synced(managedObjectContext) { return PrivacySetting(rawValue: self.rPrivacySettings ?? 0) ?? PrivacySetting.NoSending } }
        set(p) { synced(managedObjectContext) { self.rPrivacySettings = p.rawValue } }
    }
    public var scheduledImmobilizerEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rScheduledImmobilizerEnabled?.boolValue ?? false } }
        set(s) { synced(managedObjectContext) { self.rScheduledImmobilizerEnabled = s } }
    }
    public var startStopEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rStartStopEnabled?.boolValue ?? false } }
        set(s) { synced(managedObjectContext) { self.rStartStopEnabled = s } }
    }
    public var stopAtParkEnabled : Bool {
        get { return synced(managedObjectContext) { return self.rStopAtParkEnabled?.boolValue ?? false } }
        set(s) { synced(managedObjectContext) { self.rStopAtParkEnabled = s } }
    }
}
