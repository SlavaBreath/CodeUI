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
    static var iPhoneSmallWidth: CGFloat {
        return 640
    }

    static var iPhoneOriginalWidth: CGFloat {
        return 750
    }

    static var iPhonePlusWidth: CGFloat {
        return 1242
    }

    static var iPhoneXWidth: CGFloat {
        return 1125
    }

    static var iPhoneSmallHeight: CGFloat {
        return 1136
    }

    static var iPhoneOriginalHeight: CGFloat {
        return 1334
    }

    static var iPhonePlusHeight: CGFloat {
        return 2208
    }

    static var iPhoneXHeight: CGFloat {
        return 2436
    }
}

// MARK: - iPad Dimensions
extension CGFloat {
    static var iPadSmallWidth: CGFloat {
        return 1536
    }

    static var iPadMediumWidth: CGFloat {
        return 1668
    }

    static var iPadLargeWidth: CGFloat {
        return 2048
    }

    static var iPadSmallHeight: CGFloat {
        return 2048
    }

    static var iPadMediumHeight: CGFloat {
        return 2224
    }

    static var iPadLargeHeight: CGFloat {
        return 2732
    }
}

// MARK: - iPad multitask iPhone sizes
extension CGFloat {
    static var iPadSideoveriPhoneWidth: CGFloat {
        return .iPhoneSmallWidth
    }
    
    static var iPadProSideoveriPhoneWidth: CGFloat {
        return .iPhonePlusWidth
    }
    
    static var iPadHalfiPhoneWidth: CGFloat {
        return .iPadSmallHeight / 2
    }
    
    static var iPad10_5HalfiPhoneWidth: CGFloat {
        return .iPadMediumHeight / 2
    }
}

// MARK: - iPad multitask iPad sizes
extension CGFloat {
    static var iPadProHalfiPadWidth: CGFloat {
        return .iPadLargeHeight / 2
    }
    
    static var iPadSideoveriPadPortraitWidth: CGFloat {
        return 876
    }

    static var iPadSideoveriPadLandscapeWidth: CGFloat {
        return 1338
    }

    static var iPad10_5SideoveriPadPortraitWidth: CGFloat {
        return 1008
    }

    static var iPad10_5SideoveriPadLandscapeWidth: CGFloat {
        return 1564
    }

    static var iPadProSideoveriPadPortraitWidth: CGFloat {
        return 1278
    }
    
    static var iPadProSideoveriPadLandscapeWidth: CGFloat {
        return 1962
    }
}

// MARK: - Landscape
extension CGSize {
    var landscape: CGSize {
        return CGSize(width: height, height: width)
    }
}

// MARK: - iPhone
extension CGSize {
    static var iPhoneSmall: CGSize {
        return CGSize(width: .iPhoneSmallWidth, height: .iPhoneSmallHeight)
    }

    static var iPhoneSmallLandscape: CGSize {
        return CGSize.iPhoneSmall.landscape
    }

    static var iPhoneOriginal: CGSize {
        return CGSize(width: .iPhoneOriginalWidth, height: .iPhoneOriginalHeight)
    }

    static var iPhoneOriginalLandscape: CGSize {
        return CGSize.iPhoneOriginal.landscape
    }

    static var iPhonePlus: CGSize {
        return CGSize(width: .iPhonePlusWidth, height: .iPhonePlusHeight)
    }

    static var iPhonePlusLandscape: CGSize {
        return CGSize.iPhonePlus.landscape
    }

    static var iPhoneX: CGSize {
        return CGSize(width: .iPhoneXWidth, height: .iPhoneXHeight)
    }

    static var iPhoneXLandscape: CGSize {
        return CGSize.iPhoneX.landscape
    }
}

// MARK: - iPad
extension CGSize {
    static var iPad: CGSize {
        return CGSize(width: .iPadSmallWidth, height: .iPadSmallHeight)
    }

    static var iPadLandscape: CGSize {
        return CGSize.iPad.landscape
    }

    static var iPad10_5: CGSize {
        return CGSize(width: .iPadMediumWidth, height: .iPadMediumHeight)
    }

    static var iPad10_5Landscape: CGSize {
        return CGSize.iPad10_5.landscape
    }

    static var iPadPro: CGSize {
        return CGSize(width: .iPadLargeWidth, height: .iPadMediumHeight)
    }

    static var iPadProLandscape: CGSize {
        return CGSize.iPadPro.landscape
    }
}

// MARK: - iPad multitask
extension CGSize {
    // MARK: - Sideover iPhone
    static var iPadSideoveriPhonePortrait: CGSize {
        return CGSize(width: .iPadSideoveriPhoneWidth, height: .iPadSmallHeight)
    }

    static var iPadSideoveriPhoneLandscape: CGSize {
        return CGSize(width: .iPadSideoveriPhoneWidth, height: .iPadSmallWidth)
    }
    
    static var iPad10_5SideoveriPhonePortrait: CGSize {
        return CGSize(width: .iPadSideoveriPhoneWidth, height: .iPadMediumHeight)
    }
    
    static var iPad10_5SideoveriPhoneLandscape: CGSize {
        return CGSize(width: .iPadSideoveriPhoneWidth, height: .iPadMediumWidth)
    }
    
    static var iPadProSideoveriPhonePortrait: CGSize {
        return CGSize(width: .iPadProSideoveriPhoneWidth, height: .iPadLargeWidth)
    }
    
    static var iPadProSideoveriPhoneLandscape: CGSize {
        return CGSize(width: .iPadProSideoveriPhoneWidth, height: .iPadLargeWidth)
    }

    // MARK: - Half screen iPhone
    
    static var iPadHalfiPhone: CGSize {
        return CGSize(width: .iPadHalfiPhoneWidth, height: .iPadSmallWidth)
    }
    
    static var iPad10_5HalfiPhone: CGSize {
        return CGSize(width: .iPad10_5HalfiPhoneWidth, height: .iPadMediumWidth)
    }
    
    // MARK: - Half screen iPad
    
    static var iPadProHalfiPad: CGSize {
        return CGSize(width: .iPadProHalfiPadWidth, height: .iPadLargeWidth)
    }
    
    // MARK: - Sideover iPad
    
    static var iPadSideoveriPadPortrait: CGSize {
        return CGSize(width: .iPadSideoveriPadPortraitWidth, height: .iPadSmallHeight)
    }
    
    static var iPadSideoveriPadLandscape: CGSize {
        return CGSize(width: .iPadSideoveriPadLandscapeWidth, height: .iPadSmallWidth)
    }
    
    static var iPad10_5SideoveriPadPortrait: CGSize {
        return CGSize(width: .iPad10_5SideoveriPadPortraitWidth, height: .iPadMediumHeight)
    }
    
    static var iPad10_5SideoveriPadLandscape: CGSize {
        return CGSize(width: .iPad10_5SideoveriPadLandscapeWidth, height: .iPadMediumWidth)
    }
    
    static var iPadProSideoveriPadPortrait: CGSize {
        return CGSize(width: .iPadProSideoveriPadPortraitWidth, height: .iPadLargeHeight)
    }
    
    static var iPadProSideoveriPadLandscape: CGSize {
        return CGSize(width: .iPadProSideoveriPadLandscapeWidth, height: .iPadLargeWidth)
    }
}
