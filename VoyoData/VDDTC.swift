//
//  VDDTC.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData


public class VDDTC: NSManagedObject {
    public class func getDTCForId(id: NSNumber, onDevice: VDDevice, withContext: VoyoDataContext) -> VDDTC? {
        precondition(withContext.matchingContext(onDevice), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "rDevice = %@", onDevice),
            NSPredicate(format: "rId = %@", id)
            ])
        return withContext.executeFetchRequest(request).first
    }
    public class func createDTCForId(id: NSNumber, onDevice: VDDevice, withContext: VoyoDataContext) -> VDDTC {
        precondition(withContext.matchingContext(onDevice), "Mismatching contexts")
        let dtc = getDTCForId(id, onDevice: onDevice, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        dtc.rDevice = onDevice
        dtc.rId = id
        return dtc
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber {
        get { return synced(managedObjectContext) { return self.rId ?? 0 } }
//        set(i) { synced(managedObjectContext) { self.rId = i } }
    }
    public var device : VDDevice {
        get { return synced(managedObjectContext) { return self.rDevice! } }
//        set(d) { synced(managedObjectContext) { self.rDevice = d } }
    }
    
    public var bus : NSNumber {
        get { return synced(managedObjectContext) { return self.rBus ?? 0 } }
        set(b) { synced(managedObjectContext) { self.rBus = b } }
    }
    public var number : NSNumber {
        get { return synced(managedObjectContext) { return self.rDTCNumber ?? 0 } }
        set(n) { synced(managedObjectContext) { self.rDTCNumber = n } }
    }

    public var longDescription : String {
        get { return synced(managedObjectContext) { return self.rLongDescription ?? "" } }
        set(l) { synced(managedObjectContext) { self.rLongDescription = l } }
    }
    public var name : String {
        get { return synced(managedObjectContext) { return self.rName ?? "" } }
        set(n) { synced(managedObjectContext) { self.rName = n } }
    }
    public var severity : AlertSeverity {
        get { return synced(managedObjectContext) { return AlertSeverity(rawValue: self.rSeverity ?? 0) ?? AlertSeverity.Info } }
        set(s) { synced(managedObjectContext) { self.rSeverity = s.rawValue } }
    }
    public var shortDescription : String {
        get { return synced(managedObjectContext) { return self.rShortDescription ?? "" } }
        set(s) { synced(managedObjectContext) { self.rShortDescription = s } }
    }
    public var source : NSNumber {
        get { return synced(managedObjectContext) { return self.rSource ?? 0 } }
        set(s) { synced(managedObjectContext) { self.rSource = s } }
    }
    public var active : Bool {
        get { return synced(managedObjectContext) { return self.rStillActive?.boolValue ?? false } }
        set(a) { synced(managedObjectContext) { self.rStillActive = a } }
    }
    public var symptom : NSNumber {
        get { return synced(managedObjectContext) { return self.rSymptom ?? 0 } }
        set(s) { synced(managedObjectContext) { self.rSymptom = s } }
    }
    public var timeFirstReported : NSDate {
        get { return synced(managedObjectContext) { return self.rTimeFirstReported ?? NSDate.distantPast() } }
        set(t) { synced(managedObjectContext) { self.rTimeFirstReported = t } }
    }
    public var timeLastReported : NSDate {
        get { return synced(managedObjectContext) { return self.rTimeLastReported ?? NSDate.distantFuture() } }
        set(t) { synced(managedObjectContext) { self.rTimeLastReported = t } }
    }
    

    
/*    public var deviceActiveOn : VDDevice? {
        get { return synced(managedObjectContext) { return self.rActiveOnDevice } }
        set(d) { synced(managedObjectContext) { self.rActiveOnDevice = d } }
    }*/
}
