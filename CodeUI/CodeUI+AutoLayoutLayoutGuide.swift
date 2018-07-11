//
//  CodeUI+AutoLayoutLayoutGuide.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

// MARK: - AutoLayout - Basic functionality LayoutGuide
extension CodeUI {
    @discardableResult
    public func leading(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return leading(layoutGuide.leadingAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func left(_ layoutGuide: UILayoutGuide,constant: CGFloat = 0,relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return left(layoutGuide.leftAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func trailing(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return trailing(layoutGuide.trailingAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func right(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return right(layoutGuide.rightAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func top(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return top(layoutGuide.topAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func bottom(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return bottom(layoutGuide.bottomAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func centerX(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return centerX(layoutGuide.centerXAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func centerY(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return centerY(layoutGuide.centerYAnchor, constant: constant, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func width(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return width(layoutGuide.widthAnchor, constant: constant, multiplier: multiplier, relation: relation, priority: priority)
    }
    
    @discardableResult
    public func height(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutRelation = .equal, priority: UILayoutPriority = .required) -> Self {
        return height(layoutGuide.heightAnchor, constant: constant, multiplier: multiplier, relation: relation, priority: priority)
    }
}
