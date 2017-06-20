//
//  VDVehicleType+CoreDataProperties.swift
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

extension VDVehicleType {

    @NSManaged var rId: NSNumber?
    @NSManaged var rMaxYear: NSNumber?
    @NSManaged var rMinYear: NSNumber?
    @NSManaged var rFuseImage: VDImage?
    @NSManaged var rModel: VDModel?
    @NSManaged var rOBDImage: VDImage?
    @NSManaged var rPostImmobImage: VDImage?
    @NSManaged var rPostSAPImage: VDImage?
    @NSManaged var rPostSSImage: VDImage?
    @NSManaged var rPreImmobImage: VDImage?
    @NSManaged var rPreSAPImage: VDImage?
    @NSManaged var rPreSSImage: VDImage?

}
