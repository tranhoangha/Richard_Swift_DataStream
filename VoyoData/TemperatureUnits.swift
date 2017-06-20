//
//  TemperatureUnits.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/12/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

/// TemperatureUnits enumerates units used to represent temperature
///
///
/// - Kelvin
/// - Celsius
/// - Fahrenheit
public enum TemperatureUnits : ConvertableUnits {
    case Kelvin
    case Celsius
    case Fahrenheit
    
    public func convertFromMetric(value: Double) -> Double {
        switch self {
        case .Kelvin:
            return value
        case .Celsius:
            return value - 273.15
        case .Fahrenheit:
            return (value * 1.8) - 459.67
        }
    }
    public func convertToMetric(value: Double) -> Double {
        switch self {
        case .Kelvin:
            return value
        case .Celsius:
            return value + 273.15
        case .Fahrenheit:
            return (value + 459.67) / 1.8
        }
    }
    public func unitAbbrivation() -> String {
        switch self {
        case .Kelvin:
            return "K"
        case .Celsius:
            return "°C"
        case .Fahrenheit:
            return "°F"
        }
    }
}
