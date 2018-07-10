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
        UIView.swizzle
    }
    
    /// App window to get initial sizes from
    public var window: UIWindow?
    
    /// Current configuration for constraints
    var targetConfiguration: Configuration = .default
    
    /// Configuration that device is going to change to
    var configuration: Configuration? {
        return pendingConfiguration ?? window?.configuration
    }
    
    private var layouts = [UIView: ViewLayout]()
    private var targetView: UIView?
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

// MARK: - AutoLayout - Create constraint
extension CodeUI {
    /// Creates a constraint for X axis anchor
    ///
    /// - Parameters:
    ///   - myAnchor: Anchor of current target view
    ///   - anchor: Snapping anchor
    ///   - relation: Relation of snapping
    ///   - constant: Offset from target view anchor to snapping anchor
    /// - Returns: Created constraint
    func createConstraint(myAnchor: NSLayoutXAxisAnchor,
                          to anchor: NSLayoutXAxisAnchor,
                          relation: NSLayoutRelation,
                          constant: CGFloat) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return myAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            return myAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            return myAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        }
    }
    
    /// Creates a constraint for Y axis anchor
    ///
    /// - Parameters:
    ///   - myAnchor: Anchor of current target view
    ///   - anchor: Snapping anchor
    ///   - relation: Relation of snapping
    ///   - constant: Offset from target view anchor to snapping anchor
    /// - Returns: Created constraint
    func createConstraint(myAnchor: NSLayoutYAxisAnchor,
                          to anchor: NSLayoutYAxisAnchor,
                          relation: NSLayoutRelation,
                          constant: CGFloat) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return myAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            return myAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            return myAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        }
    }
    
    /// Creates a constraint for dimension anchors
    ///
    /// - Parameters:
    ///   - myAnchor: Anchor of current target view
    ///   - anchor: Snapping anchor
    ///   - relation: Relation of snapping
    ///   - constant: Offset from target view anchor to snapping anchor or the actual size
    ///   - multiplier: Parameter used for aspect based anchors
    /// - Returns: Created constraint
    func createConstraint(myAnchor: NSLayoutDimension,
                          to anchor: NSLayoutDimension?,
                          relation: NSLayoutRelation,
                          constant: CGFloat,
                          multiplier: CGFloat) -> NSLayoutConstraint {
        if let anchor = anchor {
            switch relation {
            case .equal:
                return myAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
            case .greaterThanOrEqual:
                return myAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            case .lessThanOrEqual:
                return myAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            }
        } else {
            switch relation {
            case .equal:
                return myAnchor.constraint(equalToConstant: constant)
            case .greaterThanOrEqual:
                return myAnchor.constraint(greaterThanOrEqualToConstant: constant)
            case .lessThanOrEqual:
                return myAnchor.constraint(lessThanOrEqualToConstant: constant)
            }
        }
    }
}

// MARK: - AutoLayout - Basic functionality
extension CodeUI {
    /// Creates `leading` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `leading` anchor
    ///   - constant: Inset from  `anchor` to `targetView` `leading` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func leading(_ anchor: NSLayoutXAxisAnchor,
                        constant: CGFloat = 0,
                        relation: NSLayoutRelation = .equal,
                        priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.leadingAnchor, to: anchor, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `trailing` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `trailing` anchor
    ///   - constant: Inset from `anchor` to `targetView` `trailing` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func trailing(_ anchor: NSLayoutXAxisAnchor,
                  constant: CGFloat = 0,
                  relation: NSLayoutRelation = .equal,
                  priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.trailingAnchor, to: anchor, relation: relation, constant: -constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `left` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `left` anchor
    ///   - constant: Inset from `anchor` to `targetView` `left` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func left(_ anchor: NSLayoutXAxisAnchor,
              constant: CGFloat = 0,
              relation: NSLayoutRelation = .equal,
              priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.leftAnchor, to: anchor, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `right` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `right` anchor
    ///   - constant: Inset from `anchor` to `targetView` `right` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func right(_ anchor: NSLayoutXAxisAnchor,
               constant: CGFloat = 0,
               relation: NSLayoutRelation = .equal,
               priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.rightAnchor, to: anchor, relation: relation, constant: -constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `top` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `top` anchor
    ///   - constant: Inset from `anchor` to `targetView` `top` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func top(_ anchor: NSLayoutYAxisAnchor,
             constant: CGFloat = 0,
             relation: NSLayoutRelation = .equal,
             priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.topAnchor, to: anchor, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `bottom` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `bottom` anchor
    ///   - constant: Inset from `anchor` to `targetView` `bottom` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func bottom(_ anchor: NSLayoutYAxisAnchor,
                constant: CGFloat = 0,
                relation: NSLayoutRelation = .equal,
                priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.bottomAnchor, to: anchor, relation: relation, constant: -constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates horizontal `center` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` horizontal `center` anchor
    ///   - constant: Inset from `anchor` to `targetView` horizontal `center` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func centerX(_ anchor: NSLayoutXAxisAnchor,
                 constant: CGFloat = 0,
                 relation: NSLayoutRelation = .equal,
                 priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.centerXAnchor, to: anchor, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates vertical `center` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` vertical `center` anchor
    ///   - constant: Inset from `anchor` to `targetView` vertical `center` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func centerY(_ anchor: NSLayoutYAxisAnchor,
                 constant: CGFloat = 0,
                 relation: NSLayoutRelation = .equal,
                 priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.centerYAnchor, to: anchor, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `width` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `width` anchor
    ///   - constant: Inset from `anchor` to `targetView` `width` anchor
    ///   - multiplier: Multiplier for aspect constraints
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func width(_ anchor: NSLayoutDimension? = nil,
               constant: CGFloat = 0,
               multiplier: CGFloat = 1,
               relation: NSLayoutRelation = .equal,
               priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.widthAnchor, to: anchor, relation: relation, constant: constant, multiplier: multiplier)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `height` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `height` anchor
    ///   - constant: Inset from `anchor` to `targetView` `height` anchor
    ///   - multiplier: Multiplier for aspect constraints
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func height(_ anchor: NSLayoutDimension? = nil,
                constant: CGFloat = 0,
                multiplier: CGFloat = 1,
                relation: NSLayoutRelation = .equal,
                priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.heightAnchor, to: anchor, relation: relation, constant: constant, multiplier: multiplier)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `firstBaseline` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `firstBaseline` anchor
    ///   - constant: Inset from `anchor` to `targetView` `firstBaseline` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func firstBaseLine(_ anchor: NSLayoutYAxisAnchor,
                       constant: CGFloat = 0,
                       relation: NSLayoutRelation = .equal,
                       priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.firstBaselineAnchor, to: anchor, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `lastBaseLine` constraint
    ///
    /// - Parameters:
    ///   - anchor: Anchor snapped to `targetView` `lastBaseLine` anchor
    ///   - constant: Inset from `anchor` to `targetView` `lastBaseLine` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func lastBaseLine(_ anchor: NSLayoutYAxisAnchor,
                      constant: CGFloat = 0,
                      relation: NSLayoutRelation = .equal,
                      priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.lastBaselineAnchor, to: anchor, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
}

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
}

// MARK: - AutoLayout - Size
extension CodeUI {
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


// MARK: - UIView CodeAutoLayout support
public extension UIView {
    /// Entry point to CodeUI framework from every UIView subclass
    public var cui: CodeUI {
        assert(CodeUI.shared.window != nil, "Window property must be set before app finished launching")
        return CodeUI.shared.for(self).default()
    }
}

// MARK - AddSubviews
public extension UIView {
    /// Helper function to add multiple subviews
    ///
    /// - Parameter subviews: subviews to add to current view
    public func add(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
