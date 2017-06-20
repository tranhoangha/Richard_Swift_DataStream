//
//  AlertType.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/25/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation

public enum AlertType : NSNumber {
    /// Indicates an driver behavior related alert. These alerts typically have Info or Alert severity.
    case Behavior = 0
    /// Indicates a diagnostic alert. These alerts typically have Alert severity.
    case DTC = 1
    /// Indicates an accident related alert. These alerts typically have Critical severity.
    case Accident = 2
    /// Indicates a vehicle health alert. These alerts typically have Alert or Urgent severity.
    case Health = 3
    /// Indicates aggregate alerts.  These alerts are not typically user specific and have Info or Alert severity.
    case Aggregate = 4
    /// Indicates remote control feedback alerts.  These alerts typically have Info or Alert severity.
    case RemoteControl = 5
    /// Indicates vehicle security alert.  These alerts typically have Alert to Critical severity.
    case Security = 6
    
    public var description : String {
        get {
            switch self {
            case .DTC: return "DTC"
            case .Accident: return "Accident"
            case .Behavior: return "Behavior"
            case .Health: return "Health"
            case .Aggregate: return "Aggregate"
            case .RemoteControl: return "Remote Control"
            case .Security: return "Security"
            }
        }
    }
}