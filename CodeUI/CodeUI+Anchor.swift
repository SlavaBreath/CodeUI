//
//  CodeUI+Anchor.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

// MARK: - Anchor - Default
extension CodeUI {
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - view: View providing anchors
    ///   - inset: Inset from `view` anchors to `targetView`
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(to provider: AnchorProvider, inset: CGFloat = 0) -> Self {
        return anchor(to: provider,
                      insets: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
    }
    
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - view: View providing anchors
    ///   - insets: Insets from `view` anchors to `targetView`
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(to provider: AnchorProvider, insets: UIEdgeInsets) -> Self {
        return anchor(leading: provider.leading,
                      top: provider.top,
                      trailing: provider.trailing,
                      bottom: provider.bottom,
                      insets: insets)
    }
    
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - leading: `leading` anchor provider snapped to `targetView` `leading` anchor
    ///   - top: `top` anchor provider snapped to `targetView` `top` anchor
    ///   - trailing: `trailing` anchor provider snapped to `targetView` `trailing` anchor
    ///   - bottom: `bottom` anchor provider snapped to `targetView` `bottom` anchor
    ///   - inset: Inset from anchor providers to `targetView` anchors
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(leading: AnchorProvider? = nil,
                       top: AnchorProvider? = nil,
                       trailing: AnchorProvider? = nil,
                       bottom: AnchorProvider? = nil,
                       inset: CGFloat = 0) -> Self {
        return anchor(leading: leading,
                      top: top,
                      trailing: trailing,
                      bottom: bottom,
                      insets: UIEdgeInsets(top: inset,
                                           left: inset,
                                           bottom: inset,
                                           right: inset))
    }
    
    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
    ///
    /// - Parameters:
    ///   - leading: `leading` anchor provider snapped to `targetView` `leading` anchor
    ///   - top: `top` anchor provider snapped to `targetView` `top` anchor
    ///   - trailing: `trailing` anchor provider snapped to `targetView` `trailing` anchor
    ///   - bottom: `bottom` anchor provider snapped to `targetView` `bottom` anchor
    ///   - inset:s Insets from anchor providers to `targetView` anchors
    /// - Returns: CodeUI instance for chaining
    @discardableResult
    public func anchor(leading: AnchorProvider? = nil,
                       top: AnchorProvider? = nil,
                       trailing: AnchorProvider? = nil,
                       bottom: AnchorProvider? = nil,
                       insets: UIEdgeInsets = .zero) -> Self {
        if let leading = leading?.leading {
            self.leading(leading, constant: insets.left)
        }
        
        if let top = top?.top {
            self.top(top, constant: insets.top)
        }
        
        if let trailing = trailing?.trailing {
            self.trailing(trailing, constant: insets.right)
        }
        
        if let bottom = bottom?.bottom {
            self.bottom(bottom, constant: insets.bottom)
        }
        
        return self
    }
    
//    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
//    ///
//    /// - Parameters:
//    ///   - leading: `leading` anchor snapped to `targetView` `leading` anchor
//    ///   - top: `top` anchor snapped to `targetView` `top` anchor
//    ///   - trailing: `trailing` anchor snapped to `targetView` `trailing` anchor
//    ///   - bottom: `bottom` anchor snapped to `targetView` `bottom` anchor
//    ///   - inset: Inset from anchors to `targetView` anchors
//    /// - Returns: CodeUI instance for chaining
//    @discardableResult
//    public func anchor(leading: NSLayoutXAxisAnchor? = nil,
//                       top: NSLayoutYAxisAnchor? = nil,
//                       trailing: NSLayoutXAxisAnchor? = nil,
//                       bottom: NSLayoutYAxisAnchor? = nil,
//                       inset: CGFloat = 0) -> Self {
//        return anchor(leading: leading,
//                      top: top,
//                      trailing: trailing,
//                      bottom: bottom,
//                      insets: UIEdgeInsets(top: inset,
//                                           left: inset,
//                                           bottom: inset,
//                                           right: inset))
//    }
//    
//    /// Creates constraints for `leading`, `top`, `trailing` and `bottom` anchors
//    ///
//    /// - Parameters:
//    ///   - leading: `leading` anchor snapped to `targetView` `leading` anchor
//    ///   - top: `top` anchor snapped to `targetView` `top` anchor
//    ///   - trailing: `trailing` anchor snapped to `targetView` `trailing` anchor
//    ///   - bottom: `bottom` anchor snapped to `targetView` `bottom` anchor
//    ///   - insets: Insets from anchors to `targetView` anchors
//    /// - Returns: CodeUI instance for chaining
//    @discardableResult
//    public func anchor(leading: NSLayoutXAxisAnchor? = nil,
//                       top: NSLayoutYAxisAnchor? = nil,
//                       trailing: NSLayoutXAxisAnchor? = nil,
//                       bottom: NSLayoutYAxisAnchor? = nil,
//                       insets: UIEdgeInsets = .zero) -> Self {
//        
//        if let leading = leading {
//            self.leading(leading, constant: insets.left)
//        }
//        
//        if let top = top {
//            self.top(top, constant: insets.top)
//        }
//        
//        if let trailing = trailing {
//            self.trailing(trailing, constant: insets.right)
//        }
//        
//        if let bottom = bottom {
//            self.bottom(bottom, constant: insets.bottom)
//        }
//        
//        return self
//    }
}
