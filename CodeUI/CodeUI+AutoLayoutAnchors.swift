//
//  CodeUI+AutoLayoutAnchors.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

// MARK: - AutoLayout - Basic functionality
extension CodeUI {
    /// Creates `leading` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `leading` anchor
    ///   - constant: Inset from  `anchor` to `targetView` `leading` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func leading(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let leading = provider.leading else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.leadingAnchor, to: leading, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `left` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `left` anchor
    ///   - constant: Inset from `anchor` to `targetView` `left` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func left(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let left = provider.left else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.leftAnchor, to: left, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `trailing` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `trailing` anchor
    ///   - constant: Inset from `anchor` to `targetView` `trailing` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func trailing(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let trailing = provider.trailing else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.trailingAnchor, to: trailing, relation: relation, constant: -constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `right` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `right` anchor
    ///   - constant: Inset from `anchor` to `targetView` `right` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func right(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let right = provider.right else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.rightAnchor, to: right, relation: relation, constant: -constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `top` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `top` anchor
    ///   - constant: Inset from `anchor` to `targetView` `top` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func top(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let top = provider.top else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.topAnchor, to: top, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `bottom` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `bottom` anchor
    ///   - constant: Inset from `anchor` to `targetView` `bottom` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func bottom(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let bottom = provider.bottom else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.bottomAnchor, to: bottom, relation: relation, constant: -constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates horizontal `center` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` horizontal `center` anchor
    ///   - constant: Inset from `anchor` to `targetView` horizontal `center` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func centerX(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let centerX = provider.centerX else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.centerXAnchor, to: centerX, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates vertical `center` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` vertical `center` anchor
    ///   - constant: Inset from `anchor` to `targetView` vertical `center` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func centerY(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let centerY = provider.centerY else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.centerYAnchor, to: centerY, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `width` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `width` anchor
    ///   - constant: Inset from `anchor` to `targetView` `width` anchor
    ///   - multiplier: Multiplier for aspect constraints
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func width(_ provider: AnchorProvider? = nil, constant: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.widthAnchor, to: provider?.width, relation: relation, constant: constant, multiplier: multiplier)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `height` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `height` anchor
    ///   - constant: Inset from `anchor` to `targetView` `height` anchor
    ///   - multiplier: Multiplier for aspect constraints
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func height(_ provider: AnchorProvider? = nil, constant: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.heightAnchor, to: provider?.height, relation: relation, constant: constant, multiplier: multiplier)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `firstBaseline` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `firstBaseline` anchor
    ///   - constant: Inset from `anchor` to `targetView` `firstBaseline` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func firstBaseLine(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let firstBaseLine = provider.firstBaseLine else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.firstBaselineAnchor, to: firstBaseLine, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
    
    /// Creates `lastBaseLine` constraint
    ///
    /// - Parameters:
    ///   - provider: Provider snapped to `targetView` `lastBaseLine` anchor
    ///   - constant: Inset from `anchor` to `targetView` `lastBaseLine` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func lastBaseLine(_ provider: AnchorProvider, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView, let lastBaseLine = provider.lastBaseLine else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.lastBaselineAnchor, to: lastBaseLine, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
}
