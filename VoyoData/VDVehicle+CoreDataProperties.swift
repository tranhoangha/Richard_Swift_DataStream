//
//  VDVehicle+CoreDataProperties.swift
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

extension VDVehicle {

    @NSManaged var rName: String?
    @NSManaged var rVid: NSNumber?
    @NSManaged var rVIN: String?
    @NSManaged var rYear: NSNumber?
    @NSManaged var rAlerts: NSSet?
    @NSManaged var rFuseImage: VDImage?
    @NSManaged var rMake: VDMake?
    @NSManaged var rModel: VDModel?
    @NSManaged var rOBDImage: VDImage?
    @NSManaged var rPostImmobImage: VDImage?
    @NSManaged var rPostSAPImage: VDImage?
    @NSManaged var rPostSSImage: VDImage?
    @NSManaged var rPreImmobImage: VDImage?
    @NSManaged var rPreSAPImage: VDImage?
    @NSManaged var rPreSSImage: VDImage?

}
