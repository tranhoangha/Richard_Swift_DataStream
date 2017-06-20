//
//  VDUserAlerts+CoreDataProperties.swift
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

extension VDUserAlerts {

    @NSManaged var rCanView: NSNumber?
    @NSManaged var rHasBeenCleared: NSNumber?
    @NSManaged var rHasBeenDisplayed: NSNumber?
    @NSManaged var rPermission: NSNumber?
    @NSManaged var rPresent: NSNumber?
    @NSManaged var rAlert: VDAlert?
    @NSManaged var rUser: VDUser?

}
