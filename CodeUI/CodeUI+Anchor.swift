//
//  CodeUI+Anchor.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

// MARK: - AutoLayout - Anchor
extension CodeUI {
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - view: View providing anchors
    ///   - inset: Inset from `view` anchors to `targetView`
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(to view: UIView, inset: CGFloat = 0) -> Self {
        return anchor(to: view, insets: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
    }
    
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - view: View providing anchors
    ///   - insets: Insets from `view` anchors to `targetView`
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(to view: UIView, insets: UIEdgeInsets) -> Self {
        return anchor(leading: view.leadingAnchor, top: view.topAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, insets: insets)
    }
    
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - layoutGuide: LayoutGuide providing anchors
    ///   - inset: Inset from `layoutGuide` anchors to `targetView`
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(to layoutGuide: UILayoutGuide, inset: CGFloat = 0) -> Self {
        return anchor(to: layoutGuide, insets: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
    }
    
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - layoutGuide: LayoutGuide providing anchors
    ///   - insets: Insets `layoutGuide` view anchors to `targetView`
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(to layoutGuide: UILayoutGuide, insets: UIEdgeInsets) -> Self {
        return anchor(leading: layoutGuide.leadingAnchor, top: layoutGuide.topAnchor, trailing: layoutGuide.trailingAnchor, bottom: layoutGuide.bottomAnchor, insets: insets)
    }
    
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - leading: `leading` anchor snapped to `targetView` `leading` anchor
    ///   - top: `top` anchor snapped to `targetView` `top` anchor
    ///   - trailing: `trailing` anchor snapped to `targetView` `trailing` anchor
    ///   - bottom: `bottom` anchor snapped to `targetView` `bottom` anchor
    ///   - inset: Inset from anchors to `targetView` anchors
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(leading: NSLayoutXAxisAnchor? = nil, top: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, inset: CGFloat = 0) -> Self {
        return anchor(leading: leading, top: top, trailing: trailing, bottom: bottom, insets: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
    }
    
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - leading: `leading` anchor snapped to `targetView` `leading` anchor
    ///   - top: `top` anchor snapped to `targetView` `top` anchor
    ///   - trailing: `trailing` anchor snapped to `targetView` `trailing` anchor
    ///   - bottom: `bottom` anchor snapped to `targetView` `bottom` anchor
    ///   - insets: Insets from anchors to `targetView` anchors
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(leading: NSLayoutXAxisAnchor? = nil, top: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, insets: UIEdgeInsets = .zero) -> Self {
        
        if let leading = leading {
            self.leading(leading, constant: insets.left)
        }
        
        if let top = top {
            self.top(top, constant: insets.top)
        }
        
        if let trailing = trailing {
            self.trailing(trailing, constant: insets.right)
        }
        
        if let bottom = bottom {
            self.bottom(bottom, constant: insets.bottom)
        }
        
        return self
    }
}
