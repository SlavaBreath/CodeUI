//
//  CodeUI+Devices.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

// MARK: - Code UI - Configurations
extension CodeUI {
    /// Default configuration that includes all devices and all orientations
    ///
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func `default`() -> Self {
        targetConfiguration = .default
        return self
    }
    
    /// Configuration which includes every device and every orientation passed in
    ///
    /// - Parameters:
    ///   - size: Sizes to include
    ///   - orientation: Orientations to include
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func device(size: iOSDeviceSize, orientation: Orientation = .any) -> Self {
        targetConfiguration = .device(size: size, orientation: orientation)
        return self
    }
    
    /// Configuration which includes every device and every configuration **except** passed in
    ///
    /// - Parameters:
    ///   - size: Sizes to exclude
    ///   - orientation: Orientations for sizes to exclude
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func except(size: iOSDeviceSize, orientation: Orientation = .any) -> Self {
        let newSize = Configuration.default.size.subtracting(size)
        let newOrientation = Configuration.default.orientation.subtracting(orientation)
        targetConfiguration = .except(size: newSize, orientation: newOrientation)
        return self
    }
    
    /// Configuration which includes all devices but only in portrait mode
    ///
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func portrait() -> Self {
        targetConfiguration = .device(size: .any, orientation: .portrait)
        return self
    }
    
    /// Configuration which includes all devices but only in landscape mode
    ///
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func landscape() -> Self {
        targetConfiguration = .device(size: .any, orientation: .landscape)
        return self
    }
}
