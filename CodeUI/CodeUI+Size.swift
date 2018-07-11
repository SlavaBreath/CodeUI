//
//  CodeUI+Size.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

// MARK: - AutoLayout - Size
extension CodeUI {
    /// Creates both `width` and `height` constraints
    ///
    /// - Parameter view: View providing size for target view
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func size(_ view: UIView) -> Self {
        return width(view).height(view)
    }
    
    /// Creates both `width` and `height` constraints
    ///
    /// - Parameter layoutGuide: LayoutGuide providing size for target view
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func size(_ layoutGuide: UILayoutGuide) -> Self {
        return width(layoutGuide).height(layoutGuide)
    }
    
    /// Creates both `width` and `height` constraints
    ///
    /// - Parameter size: Size for target view
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func size(_ size: CGSize) -> Self {
        return self.size(width: size.width, height: size.height)
    }
    
    /// Creates both `width` and `height` constraints
    ///
    /// - Parameters:
    ///   - width: Width of target view
    ///   - height: Height of target view
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func size(width: CGFloat, height: CGFloat) -> Self {
        return self.width(constant: width).height(constant: height)
    }
}
