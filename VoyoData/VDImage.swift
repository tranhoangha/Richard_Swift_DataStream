//
//  VDImage.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class VDImage: NSManagedObject {
    public class func getImageForId(id: NSNumber, withContext: VoyoDataContext) -> VDImage? {
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rId = %@", id)
        return withContext.executeFetchRequest(request).first
    }
    public class func getPendingImageForDevice(device:VDDevice, withContext: VoyoDataContext) -> VDImage? {
        precondition(withContext.matchingContext(device), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rPendingDeviceAvatar = %@", device)
        return withContext.executeFetchRequest(request).first
    }
    public class func getPendingImageForUser(user:VDUser, withContext: VoyoDataContext) -> VDImage? {
        precondition(withContext.matchingContext(user), "Mismatching contexts")
        let request = FetchRequest(type: self)
        request.predicate = NSPredicate(format: "rPendingUserAvatar = %@", user)
        return withContext.executeFetchRequest(request).first
    }
    public class func createImage(image:UIImage, forDevice:VDDevice, withContext: VoyoDataContext) -> VDImage {
        precondition(withContext.matchingContext(forDevice), "Mismatching contexts")
        let imge = getPendingImageForDevice(forDevice, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        imge.rPendingDeviceAvatar = forDevice
        imge.image = image
        return imge
    }
    public class func createImage(image:UIImage, forUser:VDUser, withContext: VoyoDataContext) -> VDImage {
        precondition(withContext.matchingContext(forUser), "Mismatching contexts")
        let imge = getPendingImageForUser(forUser, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        imge.rPendingUserAvatar = forUser
        imge.image = image
        return imge
    }
    public class func createImage(id:NSNumber, withContext: VoyoDataContext) -> VDImage {
        let imge = getImageForId(id, withContext: withContext) ?? withContext.insertNewObjectForEntityForType(self)
        imge.rId = id
        return imge
    }
    
// Insert code here to add functionality to your managed object subclass
    public var id : NSNumber? {
        get { return synced(managedObjectContext) { return self.rId } }
        set(i) { synced(managedObjectContext) { if self.rId == nil { self.rId = i } } }
    }
    public var image : UIImage? {
        get { return synced(managedObjectContext) { if let img = self.rImage { return UIImage(data: img) } else { return nil } } }
        set(i) { synced(managedObjectContext) { if let img = i { self.rImage = UIImagePNGRepresentation(img) } } }
    }
    public var pendingDeviceAvatar : VDDevice? {
        get { return synced(managedObjectContext) { return self.rPendingDeviceAvatar } }
//        set(d) { synced(managedObjectContext) { self.rPendingDeviceAvatar = d } }
    }
    public var pendingUserAvatar : VDUser? {
        get { return synced(managedObjectContext) { return self.rPendingUserAvatar } }
//        set(u) { synced(managedObjectContext) { self.rPendingUserAvatar = u } }
    }
    
/*    public var deviceAvatar : [VDDevice] {
        get { return synced(managedObjectContext) { return (self.rDeviceAvatar?.allObjects as? [VDDevice]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rDeviceAvatar = NSSet(array: d) } }
    }
     public var userAvatar : [VDUser] {
        get { return synced(managedObjectContext) { return (self.rUserAvatar?.allObjects as? [VDUser]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rUserAvatar = NSSet(array: d) } }
     }

    public var typesUsingAsFuseImage : [VDVehicleType] {
        get { return synced(managedObjectContext) { return (self.rTypesUsingAsFuseImage?.allObjects as? [VDVehicleType]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rTypesUsingAsFuseImage = NSSet(array: d) } }
    }
    public var typesUsingAsOBDImage : [VDVehicleType] {
        get { return synced(managedObjectContext) { return (self.rTypesUsingAsOBDImage?.allObjects as? [VDVehicleType]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rTypesUsingAsOBDImage = NSSet(array: d) } }
    }
    public var typesUsingAsPostImmobilizationImage : [VDVehicleType] {
        get { return synced(managedObjectContext) { return (self.rTypesUsingAsPostImmobImage?.allObjects as? [VDVehicleType]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rTypesUsingAsPostImmobImage = NSSet(array: d) } }
    }
    public var typesUsingAsPostStopAtParkImage : [VDVehicleType] {
        get { return synced(managedObjectContext) { return (self.rTypesUsingAsPostSAPImage?.allObjects as? [VDVehicleType]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rTypesUsingAsPostSAPImage = NSSet(array: d) } }
    }
    public var typesUsingAsPostStartStopImage : [VDVehicleType] {
        get { return synced(managedObjectContext) { return (self.rTypesUsingAsPostSSImage?.allObjects as? [VDVehicleType]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rTypesUsingAsPostSSImage = NSSet(array: d) } }
    }
    public var typesUsingAsPreImmobilizationImage : [VDVehicleType] {
        get { return synced(managedObjectContext) { return (self.rTypesUsingAsPreImmobImage?.allObjects as? [VDVehicleType]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rTypesUsingAsPreImmobImage = NSSet(array: d) } }
    }
    public var typesUsingAsPreStopAtParkImage : [VDVehicleType] {
        get { return synced(managedObjectContext) { return (self.rTypesUsingAsPreSAPImage?.allObjects as? [VDVehicleType]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rTypesUsingAsPreSAPImage = NSSet(array: d) } }
    }
    public var typesUsingAsPreStartStopImage : [VDVehicleType] {
        get { return synced(managedObjectContext) { return (self.rTypesUsingAsPreSSImage?.allObjects as? [VDVehicleType]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rTypesUsingAsPreSSImage = NSSet(array: d) } }
    }
    
    public var vehiclesUsingAsFuseImage  : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehiclesUsingAsFuseImage?.allObjects as? [VDVehicle]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rVehiclesUsingAsFuseImage = NSSet(array: d) } }
    }
    public var vehiclesUsingAsOBDImage  : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehiclesUsingAsOBDImage?.allObjects as? [VDVehicle]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rVehiclesUsingAsOBDImage = NSSet(array: d) } }
    }
    public var vehiclesUsingAsPostImmobilizationImage  : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehiclesUsingAsPostImmobImage?.allObjects as? [VDVehicle]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rVehiclesUsingAsPostImmobImage = NSSet(array: d) } }
    }
    public var vehiclesUsingAsPostStopAtParkImage  : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehiclesUsingAsPostSAPImage?.allObjects as? [VDVehicle]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rVehiclesUsingAsPostSAPImage = NSSet(array: d) } }
    }
    public var vehiclesUsingAsPostStopStartImage  : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehiclesUsingAsPostSSImage?.allObjects as? [VDVehicle]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rVehiclesUsingAsPostSSImage = NSSet(array: d) } }
    }
    public var vehiclesUsingAsPreImmobilizationImage  : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehiclesUsingAsPreImmobImage?.allObjects as? [VDVehicle]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rVehiclesUsingAsPreImmobImage = NSSet(array: d) } }
    }
    public var vehiclesUsingAsPreStopAtParkImage  : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehiclesUsingAsPreSAPImage?.allObjects as? [VDVehicle]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rVehiclesUsingAsPreSAPImage = NSSet(array: d) } }
    }
    public var vehiclesUsingAsPreStopStartImage  : [VDVehicle] {
        get { return synced(managedObjectContext) { return (self.rVehiclesUsingAsPreSSImage?.allObjects as? [VDVehicle]) ?? [] } }
        set(d) { synced(managedObjectContext) { self.rVehiclesUsingAsPreSSImage = NSSet(array: d) } }
    }*/
}
