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

extension iOSDeviceSize: CustomStringConvertible {
    public var description: String {
        var devices = [String]()
        
        if self == .any {
            return "any size"
        }
        
        if self == .iPhones {
            devices.append("all iPhones")
        } else {
            if contains(.iPhoneSmall) {
                devices.append("iPhoneSmall")
            }
            
            if contains(.iPhoneOriginal) {
                devices.append("iPhoneOriginal")
            }
            
            if contains(.iPhonePlus) {
                devices.append("iPhonePlus")
            }
            
            if contains(.iPhoneX) {
                devices.append("iPhoneX")
            }
            
            if contains(.iPhoneSideover) {
                devices.append("iPhoneSideover")
            }
            
            if contains(.iPhonePlusSideover) {
                devices.append("iPhonePlusSideover")
            }
        }
        
        if self == .iPads {
            devices.append("all iPads")
        } else {
            if contains(.iPhoneHalf) {
                devices.append("iPhoneHalf")
            }
            
            if contains(.iPadSmall) {
                devices.append("iPadSmall")
            }
            
            if contains(.iPadMedium) {
                devices.append("iPadMedium")
            }
            
            if contains(.iPadLarge) {
                devices.append("iPadLarge")
            }
            
            if contains(.iPadSideover) {
                devices.append("iPadSideover")
            }
            
            if contains(.iPadSideover10_5) {
                devices.append("iPadSideover10_5")
            }
            
            if contains(.iPadSideoverPro) {
                devices.append("iPadSideoverPro")
            }
            
            if contains(.iPadHalf) {
                devices.append("iPadHalf")
            }
        }
        
        return devices.joined(separator: ", ")
    }
}

extension CGSize {
    var iOSDeviceSize: iOSDeviceSize {
        switch self {
            // iPhone
        case .iPhoneSmall, .iPhoneSmallLandscape: return .iPhoneSmall
        case .iPhoneOriginal, .iPhoneOriginalLandscape: return .iPhoneOriginal
        case .iPhonePlus, .iPhonePlusLandscape: return .iPhonePlus
        case .iPhoneX, .iPhoneXLandscape: return .iPhoneX
        case .iPhoneSideoverSmallPortrait, .iPhoneSideoverSmallLandscape,
             .iPhoneSideoverMediumPortrait, .iPhoneSideoverMediumLandscape: return .iPhoneSideover
        case .iPhoneSideoverLargePortrait, .iPhoneSideoverLargeLandscape: return .iPhonePlusSideover
        case .iPadSmallHalf, .iPadMediumHalf: return .iPhoneHalf
            
            // iPad
        case .iPad, .iPadLandscape: return .iPadSmall
        case .iPad10_5, .iPad10_5Landscape: return .iPadMedium
        case .iPadPro, .iPadProLandscape: return .iPadLarge
        case .iPadSideoverSmallPortrait, .iPadSideoverSmallLandscape: return .iPadSideover
        case .iPadSideoverMediumPortrait, .iPadSideoverMediumLandscape: return .iPadSideover10_5
        case .iPadSideoverLargePortrait, .iPadSideoverLargeLandscape: return .iPadSideoverPro
        case .iPadLargeHalf: return .iPadHalf
            
        default: return .iPhoneOriginal
        }
    }
}
