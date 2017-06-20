//
//  LiquidVolumeUnits.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/12/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

/// LiquidVolumeUnits enumerates units used to represent volumes of liquids(fuel).
///
/// - Liters
/// - Gallons
public enum LiquidVolumeUnits : ConvertableUnits {
    case Liters
    case Gallons
    
    public func convertFromMetric(value: Double) -> Double {
        switch self {
        case .Liters:
            return value
        case .Gallons:
            return value / 3.78541
        }
    }
    public func convertToMetric(value: Double) -> Double {
        switch self {
        case .Liters:
            return value
        case .Gallons:
            return value * 3.78541
        }
    }
    public func unitAbbrivation() -> String {
        switch self {
        case .Liters:
            return "L"
        case .Gallons:
            return "gal"
        }
    }
}
