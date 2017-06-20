//
//  DistanceUnits.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/12/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

/// DistanceUnits enumerates units used to represent distance
///
/// - Kilometers
/// - Miles
public enum DistanceUnits : ConvertableUnits {
    case Kilometers
    case Miles
    
    public func convertFromMetric(value: Double) -> Double {
        switch self {
        case .Kilometers:
            return value
        case .Miles:
            return value / 1.60934
        }
    }
    public func convertToMetric(value: Double) -> Double {
        switch self {
        case .Kilometers:
            return value
        case .Miles:
            return value * 1.60934
        }
    }
    public func unitAbbrivation() -> String {
        switch self {
        case .Kilometers:
            return "km"
        case .Miles:
            return "mi"
        }
    }
}
