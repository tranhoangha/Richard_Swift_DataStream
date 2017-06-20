//
//  UnitSystem.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 12/23/14.
//  Copyright (c) 2014 Eric Domeier. All rights reserved.
//

import Foundation

/// UnitSystem enumerates units of measurements.
/// Use the functions getDistanceUnits(), getLiquidVolumeUnits(), getEconomyUnits(), getMassUnits() to determine appropriate units to use in each case
///
/// - Metric: Metric unit system. Distance in Km, LiquidVolume in L, Economy in 100km/h, Mass in kg
/// - Imperial: Imperial unit system. Distanc in Mi, LiquidVolume in Gal, Economy in mpg, Mass in lbs
public enum UnitSystem : NSNumber {
    /// Metric unit system. Distance in Km, LiquidVolume in L, Economy in 100km/h, Mass in kg
    case Metric = 1
    /// Imperial unit system. Distanc in Mi, LiquidVolume in Gal, Economy in mpg, Mass in lbs
    case Imperial = 0
        
    /// Reports distance units used for this system
    ///
    /// - returns: Units of distance used in this system
    public func getDistanceUnits() -> DistanceUnits {
        switch self {
        case .Metric:
            return .Kilometers
        case .Imperial:
            return .Miles
        }
    }
    /// Reports volume units used for liquids in this system
    ///
    /// - returns: Units of volume used for liquids in this system
    public func getLiquidVolumeUnits() -> LiquidVolumeUnits {
        switch self {
        case .Metric:
            return .Liters
        case .Imperial:
            return .Gallons
        }
    }
    /// Reports units used for fuel economy in this system
    ///
    /// - returns: Units used for fuel economy in this system
    public func getEconomyUnits() -> EconomyUnits {
        switch self {
        case .Metric:
            return .LiterPerHundredKilometers
        case .Imperial:
            return .MilesPerGallon
        }
    }
    /// Reports units used for mass in this system
    ///
    /// - returns: Units of mass used in this system
    public func getMassUnits() -> MassUnits {
        switch self {
        case .Metric:
            return .Kilograms
        case .Imperial:
            return .Pounds
        }
    }
    /// Reports units used for speed in this system
    ///
    /// - returns: Units of speed used in this system
    public func getSpeedUnits() -> SpeedUnits {
        switch self {
        case .Metric:
            return .kph
        case .Imperial:
            return .mph
        }
    }
    /// Reports units used for temperature in this system
    ///
    /// - returns: Units of temperature used in this system
    public func getTemperatureUnits() -> TemperatureUnits {
        switch self {
        case .Metric:
            return .Celsius
        case .Imperial:
            return .Fahrenheit
        }
    }
    
    /// Reports units used for angle in this system
    ///
    /// - returns: Units of angle used in this system
    public func getAngleUnits() -> AngleUnits {
        switch self {
        case .Metric:
            return .Radians
        case .Imperial:
            return .Degrees
        }
    }
    
    /// Returns Convertible units used in this system for a given unit type.
    ///
    /// :params: type The type of units.
    /// - returns: ConvertableUnits of the unit type used in this system.
    public func getConvertibleUnits(type:UnitType) -> ConvertableUnits {
        switch type {
        case .NA, .None:
            return NullConvertableUnits()
        case .Distance:
            return getDistanceUnits()
        case .LiquidVolume:
            return getLiquidVolumeUnits()
        case UnitType.Economy:
            return getEconomyUnits()
        case .Mass:
            return getMassUnits()
        case .Speed:
            return getSpeedUnits()
        case .Temperature:
            return getTemperatureUnits()
        case .Angle:
            return getAngleUnits()
        }
    }
}
