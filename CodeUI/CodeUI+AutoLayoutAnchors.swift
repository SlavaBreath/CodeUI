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
    ///   - anchor: Anchor snapped to `targetView` `leading` anchor
    ///   - constant: Inset from  `anchor` to `targetView` `leading` anchor
    ///   - relation: Relation of snapping
    ///   - priority: Priority of constraint
    /// - Returns: Code UI instance for snapping
    @discardableResult
    public func leading(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.leadingAnchor, to: anchor, relation: relation, constant: constant)
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
    public func left(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.leftAnchor, to: anchor, relation: relation, constant: constant)
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
    public func trailing(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.trailingAnchor, to: anchor, relation: relation, constant: -constant)
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
    public func right(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
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
    public func top(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
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
    public func bottom(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
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
    public func centerX(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
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
    public func centerY(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
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
    public func width(_ anchor: NSLayoutDimension? = nil, constant: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
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
    public func height(_ anchor: NSLayoutDimension? = nil, constant: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
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
    public func firstBaseLine(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
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
    public func lastBaseLine(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        guard let v = targetView else { return self }
        v.translatesAutoresizingMaskIntoConstraints = false
        let constraint = createConstraint(myAnchor: v.lastBaselineAnchor, to: anchor, relation: relation, constant: constant)
        constraint.priority = priority
        
        targetView?.addConstraint(constraint)
        
        return self
    }
}
