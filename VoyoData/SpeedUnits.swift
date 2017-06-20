//
//  SpeedUnits.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/12/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

/// SpeedUnits enumerates units used to represent speed
///
/// - mps: Meters per second
/// - kph: Kilometers per hour
/// - mph: Miles per hour
public enum SpeedUnits : ConvertableUnits {
    case mps
    case kph
    case mph
    
    public func convertFromMetric(value: Double) -> Double {
        switch self {
        case mps:
            return value / 3.6
        case kph:
            return value // * 3.6
        case mph:
            return value / 1.6 // * 2.2369362920544025
        }
    }
    public func convertToMetric(value: Double) -> Double {
        switch self {
        case mps:
            return value * 3.6
        case kph:
            return value // / 3.6
        case mph:
            return value * 1.6 // / 2.2369362920544025
        }
    }
    public func unitAbbrivation() -> String {
        switch self {
        case .mps:
            return "mps"
        case .kph:
            return "kph"
        case .mph:
            return "mph"
        }
    }
}