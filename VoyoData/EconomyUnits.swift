//
//  EconomyUnits.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/12/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

/// EconomyUnits enumerates units used to represent fuel economy
///
/// - LitersPerKilometer
/// - MilesPerGallon
/// - HundredKilometersPerLiter
public enum EconomyUnits : ConvertableUnits {
    case LitersPerKilometer
    case MilesPerGallon
    case LiterPerHundredKilometers
    
    public func convertFromMetric(value: Double) -> Double {
        switch self {
        case .LitersPerKilometer:
            return value
        case .MilesPerGallon:
            if value == 0 {
                return 0
            } else {
                return DistanceUnits.Miles.convertFromMetric(1/LiquidVolumeUnits.Gallons.convertFromMetric(value))
            }
        case .LiterPerHundredKilometers:
            return value/100
        }
    }
    public func convertToMetric(value: Double) -> Double {
        switch self {
        case .LitersPerKilometer:
            return value
        case .MilesPerGallon:
            if value == 0 {
                return 0
            } else {
                return LiquidVolumeUnits.Gallons.convertToMetric(1/DistanceUnits.Miles.convertToMetric(value))
            }
        case .LiterPerHundredKilometers:
            return value*100
        }
    }
    public func unitAbbrivation() -> String {
        switch self {
        case .LitersPerKilometer:
            return "L/km"
        case .MilesPerGallon:
            return "mpg"
        case .LiterPerHundredKilometers:
            return "L/100 km"
            
        }
    }
}
