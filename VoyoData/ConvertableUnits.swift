//
//  ConvertableUnits.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/12/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

/// ConvertableUnits are used to convert values.
/// Values provided by the user should be converted to metric before being stored and values present to the user should be converted from metric before displaying
public protocol ConvertableUnits {
    /// Converts value from metric to units defined by this object.
    ///
    /// - parameter value: The value to be converted.
    /// - returns: The result of the conversion.
    func convertFromMetric(value:Double) -> Double
    /// Converts value from the units defined by this object to metric.
    ///
    /// - parameter value: The value to be converted.
    /// - returns: The result of the conversion.
    func convertToMetric(value:Double) -> Double
    /// Indicates Unit abbrivation
    ///
    /// - returns: The abbrivation appropriate for the unit
    func unitAbbrivation() -> String
}