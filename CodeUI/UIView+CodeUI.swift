//
//  UIView+CodeUI.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/9/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

extension UIView {
    /// Entry point to CodeUI framework from every UIView subclass
    public var cui: CodeUI {
        assert(CodeUI.shared.window != nil, "Window property must be set before app finished launching")
        return CodeUI.shared.for(self).default()
    }
    
    /// Helper function to add multiple subviews
    ///
    /// - Parameter subviews: subviews to add to current view
    public func add(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
    
    /// Helper function to add subviews
    ///
    /// - Parameter subview: subview to add to current view
    public func add(_ subview: UIView) {
        addSubview(subview)
    }
    
    
    private static var ViewLayoutsKey = "ViewLayoutsKey"
    
    var layout: ViewLayout {
        get {
            if let layout = objc_getAssociatedObject(self, &UIView.ViewLayoutsKey) as? ViewLayout {
                return layout
            }
            return ViewLayout()
        }
        set {
            objc_setAssociatedObject(self, &UIView.ViewLayoutsKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func addConstraint(_ constraint: NSLayoutConstraint) {
        layout.add(CodeUI.shared.targetConfiguration, constraint: constraint)
    }
    
    func deactivate() {
        guard let configuration = CodeUI.shared.configuration else { return }
        
        layout.deactivate(for: configuration)
        subviews.forEach { $0.deactivate() }
    }
    
    func activate() {
        guard let configuration = CodeUI.shared.configuration else { return }
        
        layout.activate(for: configuration)
        subviews.forEach { $0.activate() }
    }
}
