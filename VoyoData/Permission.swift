//
//  Permission.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/28/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation

public protocol HasPriority {
    var priority : Int { get }
}

public enum Permission : NSNumber, HasPriority {
    case Admin = 1
    case User = 2
    case Requesting = 3
    case Denied = 4
    
    public var description : String {
        get {
            switch self {
            case .Admin: return "Admin"
            case .User: return "User"
            case .Requesting: return "Requesting"
            case .Denied: return "Denied"
            }
        }
    }
    public var priority : Int { get { return 6 - self.rawValue.integerValue } }
}