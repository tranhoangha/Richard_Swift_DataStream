//
//  NullConvertableUnits.swift
//  VoyoFramework
//
//  Created by Eric Domeier on 8/12/15.
//  Copyright (c) 2015 Eric Domeier. All rights reserved.
//

import Foundation

class NullConvertableUnits : ConvertableUnits {
    func convertFromMetric(value: Double) -> Double {
        return 1
    }
    func convertToMetric(value: Double) -> Double {
        return 1
    }
    func unitAbbrivation() -> String { return "" }
}
