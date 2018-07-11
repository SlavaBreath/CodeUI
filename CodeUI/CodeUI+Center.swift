//
//  CodeUI+Center.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

// MARK: - AutoLayout - Center
extension CodeUI {
    /// Creates both `vertical` and `horizontal` center constraints
    ///
    /// - Parameters:
    ///   - view: View which is used to center target view
    ///   - offset: Offset from center of passed view
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func center(in view: UIView, offset: UIOffset = .zero) -> Self {
        return centerX(view.centerXAnchor, constant: offset.horizontal)
            .centerY(view.centerYAnchor, constant: offset.vertical)
    }
    
    /// Creates both `vertical` and `horizontal` center constraints
    ///
    /// - Parameters:
    ///   - layoutGuide: LayoutGuide which is used to center target view
    ///   - offset: Offset from center of passed view
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func center(in layoutGuide: UILayoutGuide, offset: UIOffset = .zero) -> Self {
        return centerX(layoutGuide.centerXAnchor, constant: offset.horizontal)
            .centerY(layoutGuide.centerYAnchor, constant: offset.vertical)
    }
}
