//
//  CodeUI+AutoLayoutView.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

// MARK: - AutoLayout - Basic functionality View
extension CodeUI {
    @discardableResult
    public func leading(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return leading(view.leadingAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func left(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return left(view.leftAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func trailing(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return trailing(view.trailingAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func right(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return right(view.rightAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func top(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return top(view.topAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func bottom(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return bottom(view.bottomAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func centerX(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return centerX(view.centerXAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func centerY(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return centerY(view.centerYAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func width(_ view: UIView, constant: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return width(view.widthAnchor, constant: constant, multiplier: multiplier, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func height(_ view: UIView, constant: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return height(view.heightAnchor, constant: constant, multiplier: multiplier, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func firstBaseLine(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return firstBaseLine(view.firstBaselineAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    
    
    @discardableResult
    public func lastBaseLine(_ view: UIView, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return lastBaseLine(view.lastBaselineAnchor, constant: constant, relation: relation, priority: priority)
    }
}
