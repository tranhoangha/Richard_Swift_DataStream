//
//  VoyoDataContext.swift
//  VoyoInternal
//
//  Created by Eric Domeier on 9/9/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData
//import VoyoCore
 
public class VoyoDataContext {
    private var context : NSManagedObjectContext
    init(context:NSManagedObjectContext) {
        context.retainsRegisteredObjects = false
        self.context = context
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(VoyoDataContext.didSaveNotification(_:)), name: NSManagedObjectContextDidSaveNotification, object: nil)
    }
    @objc func didSaveNotification(notification : NSNotification) {
        if let c = notification.object as? NSManagedObjectContext {
            if c == context { return }
            if c.persistentStoreCoordinator != context.persistentStoreCoordinator { return }
            synced(context) { self.context.mergeChangesFromContextDidSaveNotification(notification) }
        }
    }
    func insertNewObjectForEntityForType<T:NSManagedObject>(type: T.Type) -> T {
        return synced(context) {
            return NSEntityDescription.insertNewObjectForEntityForType(type, inManagedObjectContext: self.context)
        }
    }
    func deleteObject(object:NSManagedObject) {
        context.deleteObject(object)
    }
    func save() {
        synced(context) {
            if self.context.hasChanges {
                do {
                    try self.context.save()
                } catch {
                    NSLog("Error saving context: \(error)")
                    NSLog("Reported Error")
                }
            }
        }
    }
    func discardObject(object:NSManagedObject) {
//        context.refreshObject(object, mergeChanges: false)
    }
    func contextSynced(closure:()->()) {
        objc_sync_enter(context)
        closure()
        objc_sync_exit(context)
    }
    func executeFetchRequest<T:NSManagedObject>(request: FetchRequest<T>) -> [T] {
        return synced(self) {
            return self.context.executeFetchRequest(request)
        }
    }
    func matchingContext(managedObject:NSManagedObject) -> Bool {
        return self.context == managedObject.managedObjectContext
    }
}