//
//  VDContact+CoreDataProperties.swift
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

extension VDContact {

    @NSManaged var rEmail: String?
    @NSManaged var rFirstName: String?
    @NSManaged var rId: NSNumber?
    @NSManaged var rLastName: String?
    @NSManaged var rPhoneNumber: String?
    @NSManaged var rUser: VDUser?

}
