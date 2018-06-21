//
//  UIWindowConfiguration.swift
//  CodeUI
//
// Created by Vyacheslav Nagornyak on 5/29/18.
// Copyright (c) 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

extension UIWindow {
    var configuration: Configuration {
        let h = traitCollection.horizontalSizeClass
        let v = traitCollection.verticalSizeClass
        let size = frame.size
        
        switch (h, v) {
        case (.compact, .compact):
            switch size {
            case .iPhoneSmallLandscape: return .device(size: .iPhoneSmall, orientation: .landscape)
            case .iPhoneOriginalLandscape: return .device(size: .iPhoneOriginal, orientation: .landscape)
            case .iPhoneXLandscape: return .device(size: .iPhoneX, orientation: .landscape)
            default: return .device(size: .iPhoneOriginal, orientation: .landscape)
            }
            
        case (.compact, .regular):
            switch size {
            case .iPhoneSmall: return .device(size: .iPhoneSmall, orientation: .portrait)
            case .iPhoneOriginal: return .device(size: .iPhoneOriginal, orientation: .portrait)
            case .iPhonePlus: return .device(size: .iPhonePlus, orientation: .portrait)
            case .iPhoneX: return .device(size: .iPhoneX, orientation: .portrait)
            default: return .device(size: .iPhoneOriginal, orientation: .portrait)
            }
            
        case (.regular, .compact): return .device(size: .iPhonePlus, orientation: .landscape)
            
        case (.regular, .regular):
            switch size {
            case .iPad: return .device(size: .iPadSmall, orientation: .portrait)
            case .iPadLandscape: return .device(size: .iPadSmall, orientation: .landscape)
            case .iPad10_5: return .device(size: .iPadMedium, orientation: .portrait)
            case .iPad10_5Landscape: return .device(size: .iPadMedium, orientation: .landscape)
            case .iPadPro: return .device(size: .iPadLarge, orientation: .portrait)
            case .iPadProLandscape: return .device(size: .iPadLarge, orientation: .landscape)
            default: return .device(size: .iPadSmall, orientation: frame.size.orientation)
            }
            
        default: return .device(size: .any, orientation: .any)
        }
    }
}
