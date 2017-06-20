//
//  UnitType.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/12/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

/// UnitType are used to indicate the type of units a value represents.
///
/// - NA: Value is not displayable.
/// - None: Value has no units.
/// - LiquidVolume: Value represents a liquid volume.
/// - Speed: Value represents a speed.
/// - Temperature: Value represents a temperature.
/// - Angle: Value represents a angle
/// - Mass: Value represents a mass
public enum UnitType {
    case NA
    case None
    case Distance
    case LiquidVolume
    case Economy
    case Mass
    case Speed
    case Angle
    case Temperature
}