//
//  RequestStatus.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/28/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation

public enum RequestStatus : NSNumber {
    case New = 0
    case Viewed = 1
    case Accepted = 2
    case Rejected = 3
}