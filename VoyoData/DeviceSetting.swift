//
//  DeviceSetting.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/28/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation

public enum DeviceSetting : NSNumber {
    case AutoKeyAllowed = 0x00
    case KeyDriverDoorOnly = 0x01
    case LockUnlockEnabled = 0x02
    case ImmobilizerEnabled = 0x03
    case ScheduledImmobilizerEnabled = 0x04
    case ImmobilizerTimes = 0x05
    case StopAtParkEnabled = 0x06
    case StartStopEnabled = 0x07
    case AutoStopEnabled = 0x08
    case AutoStopTime = 0x09
    case PrivacySettingEnabled = 0x0A
    case DeviceName = 0x0B
    case ProximityMobilizationEnabled = 0x0C
}