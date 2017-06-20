//
//  MassUnits.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/12/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

/// MassUnits enumerates units used to represent mass.
///
/// - Kilograms
/// - Pounds
public enum MassUnits : ConvertableUnits {
    case Kilograms
    case Pounds
    
    public func convertFromMetric(value: Double) -> Double {
        switch self {
        case .Kilograms:
            return value
        case .Pounds:
            return value * 2.20462
        }
    }
    public func convertToMetric(value: Double) -> Double {
        switch self {
        case .Kilograms:
            return value
        case .Pounds:
            return value / 2.20462
        }
    }
    public func unitAbbrivation() -> String {
        switch self {
        case .Kilograms:
            return "kg"
        case .Pounds:
            return "lbs"
        }
    }
}
