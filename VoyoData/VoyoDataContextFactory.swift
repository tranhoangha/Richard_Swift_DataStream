//
//  VoyoDataContextFactory.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/21/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData

public class VoyoDataReference : ModelReference {
    private static let lock = VDLock()
    private static var persistentStoreCoordinator : NSPersistentStoreCoordinator? = nil

    public class func modelName() -> String { return "VoyoDataModel" }
    public class func getPersistentStoreCoordinator() -> NSPersistentStoreCoordinator {
        return synced(lock) {
            if let p = persistentStoreCoordinator {
                return p
            } else {
                let url : NSURL = NSBundle(forClass: self).URLForResource(self.modelName(), withExtension: "momd")!
                let model = NSManagedObjectModel(contentsOfURL: url)
                let storeURL = (try? NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true))?.URLByAppendingPathComponent(self.modelName()+".sqlite")
                let p = NSPersistentStoreCoordinator(managedObjectModel: model!)
                do {
                    try p.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: [NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true])
                } catch {}
                persistentStoreCoordinator = p
                return p
            }
        }
    }
}

class VoyoDataContextFactory {
    func createContext() -> VoyoDataContext {
        let context = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        context.persistentStoreCoordinator = VoyoDataReference.getPersistentStoreCoordinator()
        return VoyoDataContext(context: context)
    }
}