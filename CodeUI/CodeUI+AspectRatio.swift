//
//  CodeUI+AspectRatio.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

// MARK: - AutoLayout - Aspect Ratio
extension CodeUI {
    /// Creates aspect ratio constraint that is equal to `1 : 1`
    ///
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func square() -> Self {
        return aspectRatio(1)
    }
    
    /// Creates aspect ratio constraint that is equal `widht : height`
    ///
    /// - Parameters:
    ///   - width: Width of aspect
    ///   - height: Height of aspect
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func aspectRatio(width: CGFloat, height: CGFloat) -> Self {
        assert(height != 0.0, "height cannot be zero")
        guard height != 0.0 else { return self }
        return aspectRatio(width / height)
    }
    
    /// Creates aspect ratio constraint
    ///
    /// - Parameter aspect: Aspect ratio value
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func aspectRatio(_ aspect: CGFloat) -> Self {
        guard let v = targetView else { return self }
        return width(v.heightAnchor, multiplier: aspect)
    }
}
