//
//  VDDTC+CoreDataProperties.swift
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

extension VDDTC {

    @NSManaged var rBus: NSNumber?
    @NSManaged var rDTCNumber: NSNumber?
    @NSManaged var rId: NSNumber?
    @NSManaged var rLongDescription: String?
    @NSManaged var rName: String?
    @NSManaged var rSeverity: NSNumber?
    @NSManaged var rShortDescription: String?
    @NSManaged var rSource: NSNumber?
    @NSManaged var rStillActive: NSNumber?
    @NSManaged var rSymptom: NSNumber?
    @NSManaged var rTimeFirstReported: NSDate?
    @NSManaged var rTimeLastReported: NSDate?
    @NSManaged var rActiveOnDevice: VDDevice?
    @NSManaged var rDevice: VDDevice?

}
