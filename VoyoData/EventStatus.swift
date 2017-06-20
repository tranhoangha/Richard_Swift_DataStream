//
//  EventStatus.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/26/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation

public enum EventStatus : NSNumber {
    case FromServer = 0
    case ToReport = 1
    case Dismissed = 2
}