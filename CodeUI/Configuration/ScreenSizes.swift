//
//  ScreenSizes.swift
//  CodeUI
//
// Created by Vyacheslav Nagornyak on 5/29/18.
// Copyright (c) 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

//MARK: - iPhone dimensions
extension CGFloat {
    /// iPhone 5, 5S, 5C, SE screen width
    static var iPhoneSmallWidth: CGFloat {
        return 640
    }

    /// iPhone 6, 6S, 7, 8 screen width
    static var iPhoneOriginalWidth: CGFloat {
        return 750
    }

    /// iPhone 6+, 6S+, 7+, 8+ screen width
    static var iPhonePlusWidth: CGFloat {
        return 1242
    }

    /// iPhone X screen width
    static var iPhoneXWidth: CGFloat {
        return 1125
    }

    /// iPhone 5, 5S, 5C, SE screen height
    static var iPhoneSmallHeight: CGFloat {
        return 1136
    }

    /// iPhone 6, 6S, 7, 8 screen height
    static var iPhoneOriginalHeight: CGFloat {
        return 1334
    }

    /// iPhone 6+, 6S+, 7+, 8+ screen height
    static var iPhonePlusHeight: CGFloat {
        return 2208
    }

    /// iPhone X screen height
    static var iPhoneXHeight: CGFloat {
        return 2436
    }
}

// MARK: - iPad Dimensions
extension CGFloat {
    /// iPad 7.9", iPad 9.7" screen width
    static var iPadSmallWidth: CGFloat {
        return 1536
    }

    /// iPad 10.5" screen width
    static var iPadMediumWidth: CGFloat {
        return 1668
    }

    /// iPad 12.9" screen width
    static var iPadLargeWidth: CGFloat {
        return 2048
    }

    /// iPad 7.9", iPad 9.7" screen height
    static var iPadSmallHeight: CGFloat {
        return 2048
    }

    /// iPad 10.5" screen height
    static var iPadMediumHeight: CGFloat {
        return 2224
    }

    /// iPad 12.9" screen height
    static var iPadLargeHeight: CGFloat {
        return 2732
    }
}

// MARK: - iPad multitask iPhone sizes
extension CGFloat {
    /// iPad 7.9", 9.7", 10.5" sideover small width
    static var iPhoneSideoverWidth: CGFloat {
        return .iPhoneSmallWidth
    }
    
    /// iPad 12.9" sideover small width
    static var iPhonePlusSideoverWidth: CGFloat {
        return .iPhonePlusWidth
    }
    
    /// iPad 7.9", 9.7" half scrren width
    static var iPadSmallHalfWidth: CGFloat {
        return .iPadSmallHeight / 2
    }
    
    /// iPad 10.5" half scrren width
    static var iPadMediumHalfWidth: CGFloat {
        return .iPadMediumHeight / 2
    }
}

// MARK: - iPad multitask iPad sizes
extension CGFloat {
    /// iPad 7.9", 9.7" sideover large portrait width
    static var iPadSideoverSmallPortraitWidth: CGFloat {
        return 876
    }

    /// iPad 7.9", 9.7" sideover large landscape width
    static var iPadSideoverSmallLandscapeWidth: CGFloat {
        return 1338
    }

    /// iPad 10.5" sideover large portrait width
    static var iPadSideoverMediumPortraitWidth: CGFloat {
        return 1008
    }

    /// iPad 10.5" sideover large landscape width
    static var iPadSideoverMediumLandscapeWidth: CGFloat {
        return 1564
    }

    /// iPad 12.9" sideover large portrait width
    static var iPadSideoverLargePortraitWidth: CGFloat {
        return 1278
    }
    
    /// iPad 12.9" sideover large landscape width
    static var iPadSideoverLargeLandscapeWidth: CGFloat {
        return 1962
    }
    
    /// iPad 12.9" half scrren width
    static var iPadLargeHalfWidth: CGFloat {
        return .iPadLargeHeight / 2
    }
}

// MARK: - Landscape
extension CGSize {
    /// Flips width and height
    var landscape: CGSize {
        return CGSize(width: height, height: width)
    }
}

// MARK: - iPhone
extension CGSize {
    /// iPhone 5, 5S, 5C, SE portrait screen size
    static var iPhoneSmall: CGSize {
        return CGSize(width: .iPhoneSmallWidth, height: .iPhoneSmallHeight)
    }

    /// iPhone 5, 5S, 5C, SE landscape screen size
    static var iPhoneSmallLandscape: CGSize {
        return CGSize.iPhoneSmall.landscape
    }

    /// iPhone 6, 6S, 7, 8 portrait screen size
    static var iPhoneOriginal: CGSize {
        return CGSize(width: .iPhoneOriginalWidth, height: .iPhoneOriginalHeight)
    }

    /// iPhone 6, 6S, 7, 8 landscape screen size
    static var iPhoneOriginalLandscape: CGSize {
        return CGSize.iPhoneOriginal.landscape
    }

    /// iPhone 6+, 6S+, 7+, 8+ portrait screen size
    static var iPhonePlus: CGSize {
        return CGSize(width: .iPhonePlusWidth, height: .iPhonePlusHeight)
    }

    /// iPhone 6+, 6S+, 7+, 8+ landscape screen size
    static var iPhonePlusLandscape: CGSize {
        return CGSize.iPhonePlus.landscape
    }

    /// iPhone X portrait screen size
    static var iPhoneX: CGSize {
        return CGSize(width: .iPhoneXWidth, height: .iPhoneXHeight)
    }

    /// iPhone X landscape screen size
    static var iPhoneXLandscape: CGSize {
        return CGSize.iPhoneX.landscape
    }
}

// MARK: - iPad
extension CGSize {
    /// iPad 7.9", 9.7" portrait screen size
    static var iPad: CGSize {
        return CGSize(width: .iPadSmallWidth, height: .iPadSmallHeight)
    }

    /// iPad 7.9", 9.7" landscape screen size
    static var iPadLandscape: CGSize {
        return CGSize.iPad.landscape
    }

    /// iPad 10.5" portrait screen size
    static var iPad10_5: CGSize {
        return CGSize(width: .iPadMediumWidth, height: .iPadMediumHeight)
    }

    /// iPad 10.5" landscape screen size
    static var iPad10_5Landscape: CGSize {
        return CGSize.iPad10_5.landscape
    }

    /// iPad 12.9" portrait screen size
    static var iPadPro: CGSize {
        return CGSize(width: .iPadLargeWidth, height: .iPadMediumHeight)
    }

    /// iPad 12.9" landscape screen size
    static var iPadProLandscape: CGSize {
        return CGSize.iPadPro.landscape
    }
}

// MARK: - iPad multitask
extension CGSize {
    // MARK: - Sideover iPhone
    /// iPad 7.9", 9.7" sideover small portrait size
    static var iPhoneSideoverSmallPortrait: CGSize {
        return CGSize(width: .iPhoneSideoverWidth, height: .iPadSmallHeight)
    }

    /// iPad 7.9", 9.7" sideover small landscape size
    static var iPhoneSideoverSmallLandscape: CGSize {
        return CGSize(width: .iPhoneSideoverWidth, height: .iPadSmallWidth)
    }
    
    /// iPad 10.5" sideover small portrait size
    static var iPhoneSideoverMediumPortrait: CGSize {
        return CGSize(width: .iPhoneSideoverWidth, height: .iPadMediumHeight)
    }
    
    /// iPad 10.5" sideover small landscape size
    static var iPhoneSideoverMediumLandscape: CGSize {
        return CGSize(width: .iPhoneSideoverWidth, height: .iPadMediumWidth)
    }
    
    /// iPad 12.9" sideover small portrait size
    static var iPhoneSideoverLargePortrait: CGSize {
        return CGSize(width: .iPhonePlusSideoverWidth, height: .iPadLargeWidth)
    }
    
    /// iPad 12.9" sideover small landscape size
    static var iPhoneSideoverLargeLandscape: CGSize {
        return CGSize(width: .iPhonePlusSideoverWidth, height: .iPadLargeWidth)
    }

    // MARK: - Half screen iPhone
    /// iPad 7.9", 9.7" half size
    static var iPadSmallHalf: CGSize {
        return CGSize(width: .iPadSmallHalfWidth, height: .iPadSmallWidth)
    }
    
    /// iPad 10.5" half size
    static var iPadMediumHalf: CGSize {
        return CGSize(width: .iPadMediumHalfWidth, height: .iPadMediumWidth)
    }
    
    // MARK: - Half screen iPad
    /// iPad 12.9" half size
    static var iPadLargeHalf: CGSize {
        return CGSize(width: .iPadLargeHalfWidth, height: .iPadLargeWidth)
    }
    
    // MARK: - Sideover iPad
    /// iPad 7.9", 9.7" sideover large portrait size
    static var iPadSideoverSmallPortrait: CGSize {
        return CGSize(width: .iPadSideoverSmallPortraitWidth, height: .iPadSmallHeight)
    }
    
    /// iPad 7.9", 9.7" sideover large landscape size
    static var iPadSideoverSmallLandscape: CGSize {
        return CGSize(width: .iPadSideoverSmallLandscapeWidth, height: .iPadSmallWidth)
    }
    
    /// iPad 10.5" sideover large portrait size
    static var iPadSideoverMediumPortrait: CGSize {
        return CGSize(width: .iPadSideoverMediumPortraitWidth, height: .iPadMediumHeight)
    }
    
    /// iPad 10.5" sideover large landscape size
    static var iPadSideoverMediumLandscape: CGSize {
        return CGSize(width: .iPadSideoverMediumLandscapeWidth, height: .iPadMediumWidth)
    }
    
    /// iPad 12.9" sideover large portrait size
    static var iPadSideoverLargePortrait: CGSize {
        return CGSize(width: .iPadSideoverLargePortraitWidth, height: .iPadLargeHeight)
    }
    
    /// iPad 12.9" sideover large landscape size
    static var iPadSideoverLargeLandscape: CGSize {
        return CGSize(width: .iPadSideoverLargeLandscapeWidth, height: .iPadLargeWidth)
    }
}
