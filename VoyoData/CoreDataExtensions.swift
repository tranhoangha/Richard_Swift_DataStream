//
//  CoreDataExtensions.swift
//  VoyoCore
//
//  Created by Eric Domeier on 9/8/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation
import CoreData



public protocol ConvertableToBytes {
    func toBytes() -> [UInt8]
}
extension NSData : ConvertableToBytes {
    public func toBytes() -> [UInt8] {
        var d:[UInt8] = []
        while d.count < self.length { d.append(0) }
        getBytes(&d, length: d.count)
        return d
    }
    public class func fromBytes(bytes:[UInt8]) -> NSData {
        return NSData(bytes: bytes, length: bytes.count)
    }
}

public protocol ModelReference : class {
    static func modelName() -> String
    static func getPersistentStoreCoordinator() -> NSPersistentStoreCoordinator
}

public extension NSManagedObject {
    public class func entityName() -> String {
        let fullClassName = NSStringFromClass(object_getClass(self))
        let nameComponents = fullClassName.characters.split { $0 == "." }.map { String($0) }
        return nameComponents.last!
    }
}

public extension NSEntityDescription {
    public class func insertNewObjectForEntityForType<T:NSManagedObject>(type: T.Type, inManagedObjectContext context: NSManagedObjectContext) -> T {
        return NSEntityDescription.insertNewObjectForEntityForName(T.entityName(), inManagedObjectContext: context) as! T
    }
}

public extension NSManagedObjectContext {
    
    public func executeFetchRequest<T:NSManagedObject>(request: FetchRequest<T>)-> [T]{
        let fetchRequest = getNSFetchRequest(request)
        return synced(self) {
            do {
                let r = try self.executeFetchRequest(fetchRequest)
                if let rval = r as? [T] {
                    return rval
                } else {
                    return []
                }
            } catch {
                return []
            }
        }
    }
    private func getNSFetchRequest<T:NSManagedObject>(request: FetchRequest<T>) -> NSFetchRequest {
        if let fr = request.nsFetchRequest { return fr }
        let fetchRequest = NSFetchRequest(entityName: T.entityName())
        fetchRequest.sortDescriptors = request.sortDescriptors
        if let l = request.limit { fetchRequest.fetchLimit = l }
        fetchRequest.predicate = request.predicate
        request.nsFetchRequest = fetchRequest
//        NSLog("Fetching Limit: \(fetchRequest.fetchLimit)")
        return fetchRequest
    }
}

public class FetchRequest<T:NSManagedObject> {
    private var nsFetchRequest : NSFetchRequest? = nil
    public init(type:T.Type) {}
    public var predicate : NSPredicate? = nil
    public var sortDescriptors : [NSSortDescriptor]? = nil
    public var sortDescriptor : NSSortDescriptor? {
        get { if let sd = sortDescriptors where sd.count > 0 { return sd[0] } else { return nil } }
        set(s) { if let ss = s { sortDescriptors = [ss] } else { sortDescriptors = nil } }
    }
    public var limit : Int? = nil
}