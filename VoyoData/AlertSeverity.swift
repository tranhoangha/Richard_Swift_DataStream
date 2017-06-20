//
//  AlertSeverity.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/25/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
/// AlertSeverity Enumerates the severity of an alert.
///
/// - Info: Indicates basic information relevant to the user.  These alerts are usually only displayed once to the user and are not shared.
/// - Alert: Indicates a typical alert. These alerts are generally saved and are shared with administrators of the vehicle.
/// - Urgent: Indicates a important alert. These alerts generally reflect vehicle state and are not user specific so reported to all users.
/// - Critical: Indicates a critical alert. These alerts generally relates to an accident and are shared with all users of the vehicle.
public enum AlertSeverity : NSNumber {
    case Info = 0
    case Alert = 1
    case Urgent = 2
    case Critical = 3

    public var description : String {
        get {
            switch self {
            case .Info: return "Info"
            case .Alert: return "Alert"
            case .Urgent: return "Urgent"
            case .Critical: return "Critical"
            }
        }
    }
}
