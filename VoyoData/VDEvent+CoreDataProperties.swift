//
//  VDEvent+CoreDataProperties.swift
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

extension VDEvent {

    @NSManaged var rDate: NSDate?
    @NSManaged var rId: NSNumber?
    @NSManaged var rLatitude: NSDecimalNumber?
    @NSManaged var rLongitude: NSDecimalNumber?
    @NSManaged var rServerStatus: NSNumber?
    @NSManaged var rSeverity: NSNumber?
    @NSManaged var rType: NSNumber?
    @NSManaged var rReporter: VDUser?

}
