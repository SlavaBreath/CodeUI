//
//  CodeUI.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 5/24/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

public class CodeUI {
    
    /// Shared instance of CodeUI
    public static let shared = CodeUI()
    
    /// Private init for swizzling
    private init() {
        UIViewController.swizzle
    }
    
    /// App window to get initial sizes from
    public var window: UIWindow?
    
    /// Current configuration for constraints
    var targetConfiguration: Configuration = .default
    
    /// Configuration that device is going to change to
    var configuration: Configuration? {
        return pendingConfiguration ?? window?.configuration
    }
    
    var targetView: UIView?
    
    private var layouts = [UIView: ViewLayout]()
    private var pendingConfiguration: Configuration?
    private var lastCreatedConstraint: NSLayoutConstraint?
    
    /// Set view as target for constraits
    ///
    /// - Parameter view: view that is current target for constraints
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    func `for`(_ view: UIView) -> Self {
        targetView = view
        lastCreatedConstraint = nil
        return self
    }
    
    /// This func changes internal configuration based on size classes.
    /// Works in pair with `adoptToNewSize(_:)`.
    /// **Changes made here are not final**
    ///
    /// - Parameters:
    ///   - h: Horizontal size class
    ///   - v: Vertical size class
    func adoptToNewSizeClasses(h: UIUserInterfaceSizeClass, v: UIUserInterfaceSizeClass) {
        switch (h, v) {
        case (.compact, .regular): pendingConfiguration = .device(size: .iPhones, orientation: .portrait)
        case (.compact, .compact): pendingConfiguration = .device(size: .iPhones, orientation: .landscape)
        case (.regular, .compact): pendingConfiguration = .device(size: .iPhonePlus, orientation: .landscape)
        case (.regular, .regular): pendingConfiguration = .device(size: .iPads, orientation: .any)
            
        default: pendingConfiguration = .default
        }
    }
    
    /// This func changes internal configuration based on screen size.
    /// This is **final** step of changing internal layouts.
    /// May work alone from `adoptToNewSizeClasses(h:v:)
    ///
    /// - Parameter size: new size of screen
    func adoptToNewSize(_ size: CGSize) {
        pendingConfiguration = .device(size: size.iOSDeviceSize, orientation: size.orientation)
    }
}

// MARK: - UIView CodeAutoLayout support
public extension UIView {
    
}
