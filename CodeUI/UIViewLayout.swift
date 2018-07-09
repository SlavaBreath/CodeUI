//
//  UIViewLayout.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/9/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

extension UIView {
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
}
