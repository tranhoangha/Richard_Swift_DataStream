//
//  UserSetting.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/28/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation

public enum UserSetting : NSNumber {
    case None = 0x00
    case AutoKey = 0x01
    case ThresholdNotificaitonsEnabled = 0x02
    case TrafficAlertsEnabled = 0x03
    case AwardsEnabled = 0x04
    case MyAwardsEnabled = 0x05
    case CommunityAwardsEnabled = 0x06
    case NotificationsEnabled = 0x07
    case NotificationByEmail = 0x08
    case NotificaitonByText = 0x09
    case NotificaitonByPhone = 0x0A
    case AccidentNotificationsEnabled = 0x0B
    case SecurityNotificaitonsEnabled = 0x0C
    case DiagnosticNotificaitonsEnabled = 0x0D
    case BehaviorNotificaitonsEnabled = 0x0E
    case OverspeedSetting = 0x0F
    case EmergencyContactsEnabled = 0x10
    case UnitSystemSetting = 0x11
    case PrivacySetting = 0x12
    case FirstName = 0x13
    case LastName = 0x14
    case Email = 0x15
    case PhoneNumber = 0x16
    case AcceptTerms = 0x17
}