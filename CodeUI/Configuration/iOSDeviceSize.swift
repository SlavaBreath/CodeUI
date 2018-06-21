//
//  iOSDeviceSize.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 6/19/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

public struct iOSDeviceSize: OptionSet, Hashable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let iPhoneSmall = iOSDeviceSize(rawValue: 1 << 0)
    public static let iPhoneOriginal = iOSDeviceSize(rawValue: 1 << 1)
    public static let iPhonePlus = iOSDeviceSize(rawValue: 1 << 2)
    public static let iPhoneX = iOSDeviceSize(rawValue: 1 << 3)
    public static let iPhoneSideover = iOSDeviceSize(rawValue: 1 << 4)
    public static let iPhonePlusSideover = iOSDeviceSize(rawValue: 1 << 5)
    public static let iPhoneHalf = iOSDeviceSize(rawValue: 1 << 6)
    
    public static let iPadSmall = iOSDeviceSize(rawValue: 1 << 7)
    public static let iPadMedium = iOSDeviceSize(rawValue: 1 << 8)
    public static let iPadLarge = iOSDeviceSize(rawValue: 1 << 9)
    public static let iPadSideover = iOSDeviceSize(rawValue: 1 << 10)
    public static let iPadSideover10_5 = iOSDeviceSize(rawValue: 1 << 11)
    public static let iPadSideoverPro = iOSDeviceSize(rawValue: 1 << 12)
    public static let iPadHalf = iOSDeviceSize(rawValue: 1 << 13)
    
    public static let iPhones: iOSDeviceSize = [iPhoneSmall, iPhoneOriginal, iPhonePlus, iPhoneX, iPhoneSideover, iPhonePlusSideover, iPhoneHalf]
    public static let iPads: iOSDeviceSize = [iPadSmall, iPadMedium, iPadLarge, iPadSideover, iPadSideover10_5, iPadSideoverPro, iPadHalf]
    
    public static let any: iOSDeviceSize = [iPhones, iPads]
}

extension CGSize {
    var iOSDeviceSize: iOSDeviceSize {
        switch self {
            // iPhone
        case .iPhoneSmall, .iPhoneSmallLandscape: return .iPhoneSmall
        case .iPhoneOriginal, .iPhoneOriginalLandscape: return .iPhoneOriginal
        case .iPhonePlus, .iPhonePlusLandscape: return .iPhonePlus
        case .iPhoneX, .iPhoneXLandscape: return .iPhoneX
        case .iPadSideoveriPhonePortrait, .iPadSideoveriPhoneLandscape: return .iPhoneSideover
        case .iPadProSideoveriPhonePortrait, .iPadProSideoveriPhoneLandscape: return .iPhonePlusSideover
        case .iPadHalfiPhone, .iPad10_5HalfiPhone: return .iPhoneHalf
            
            // iPad
        case .iPad, .iPadLandscape: return .iPadSmall
        case .iPad10_5, .iPad10_5Landscape: return .iPadMedium
        case .iPadPro, .iPadProLandscape: return .iPadLarge
        case .iPadProHalfiPad: return .iPadSideover
        case .iPadSideoveriPadPortrait, .iPadSideoveriPadLandscape: return .iPadSideover10_5
        case .iPad10_5SideoveriPadPortrait, .iPad10_5SideoveriPadPortrait: return .iPadSideoverPro
        case .iPadProSideoveriPadPortrait, .iPadProSideoveriPadLandscape: return .iPadHalf
            
        default: return .iPhoneOriginal
        }
    }
}
