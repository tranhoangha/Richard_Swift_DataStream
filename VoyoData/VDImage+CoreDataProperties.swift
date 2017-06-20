//
//  VDImage+CoreDataProperties.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/29/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension VDImage {

    @NSManaged var rId: NSNumber?
    @NSManaged var rImage: NSData?
    @NSManaged var rDeviceAvatar: NSSet?
    @NSManaged var rPendingDeviceAvatar: VDDevice?
    @NSManaged var rPendingUserAvatar: VDUser?
    @NSManaged var rTypesUsingAsFuseImage: NSSet?
    @NSManaged var rTypesUsingAsOBDImage: NSSet?
    @NSManaged var rTypesUsingAsPostImmobImage: NSSet?
    @NSManaged var rTypesUsingAsPostSAPImage: NSSet?
    @NSManaged var rTypesUsingAsPostSSImage: NSSet?
    @NSManaged var rTypesUsingAsPreImmobImage: NSSet?
    @NSManaged var rTypesUsingAsPreSAPImage: NSSet?
    @NSManaged var rTypesUsingAsPreSSImage: NSSet?
    @NSManaged var rUserAvatar: NSSet?
    @NSManaged var rVehiclesUsingAsFuseImage: NSSet?
    @NSManaged var rVehiclesUsingAsOBDImage: NSSet?
    @NSManaged var rVehiclesUsingAsPostImmobImage: NSSet?
    @NSManaged var rVehiclesUsingAsPostSAPImage: NSSet?
    @NSManaged var rVehiclesUsingAsPostSSImage: NSSet?
    @NSManaged var rVehiclesUsingAsPreImmobImage: NSSet?
    @NSManaged var rVehiclesUsingAsPreSAPImage: NSSet?
    @NSManaged var rVehiclesUsingAsPreSSImage: NSSet?

}
