//
//  AngleUnits.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/24/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

/// AngleUnits enumerates units used to represent angle
///
/// - Rotations
/// - Radians
/// - Degrees
public enum AngleUnits : ConvertableUnits {
    case Radians
    case Rotations
    case Degrees
    
    public func convertFromMetric(value: Double) -> Double {
        switch self {
        case .Radians:
            return value
        case .Rotations:
            return value / (2.0 * M_PI)
        case .Degrees:
            return value * 180.0 / M_PI
        }
    }
    public func convertToMetric(value: Double) -> Double {
        switch self {
        case .Radians:
            return value
        case .Rotations:
            return value * 2.0 * M_PI
        case .Degrees:
            return value * M_PI / 180.0
        }
    }
    public func unitAbbrivation() -> String {
        switch self {
        case .Radians:
            return "rad"
        case .Rotations:
            return "τ"
        case .Degrees:
            return "°"
        }
    }
}