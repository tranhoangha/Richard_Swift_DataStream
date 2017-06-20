//
//  CoordinateRectangle.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/29/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation
import CoreLocation

public struct CoordinateRectangle {
    /// UpperLeft bound of the rectangle.
    public var upperLeft: CLLocationCoordinate2D
    /// LowerRight bound of the rectangle.
    public var lowerRight: CLLocationCoordinate2D
    public init(upperLeft ul: CLLocationCoordinate2D, lowerRight lr: CLLocationCoordinate2D) {
        upperLeft = ul
        lowerRight = lr
    }
}