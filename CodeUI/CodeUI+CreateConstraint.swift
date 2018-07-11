//
//  CodeUI+CreateConstraint.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

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
    func createConstraint(myAnchor: NSLayoutXAxisAnchor, to anchor: NSLayoutXAxisAnchor, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
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
    func createConstraint(myAnchor: NSLayoutYAxisAnchor, to anchor: NSLayoutYAxisAnchor, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
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
    func createConstraint(myAnchor: NSLayoutDimension, to anchor: NSLayoutDimension?, relation: NSLayoutRelation, constant: CGFloat, multiplier: CGFloat) -> NSLayoutConstraint {
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
