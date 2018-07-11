//
//  ViewControllerSwizzle.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 5/24/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

private func _swizzle(_ originalSelector: Selector, to newSelector: Selector, in target: AnyClass) {
    guard let originalMethod = class_getInstanceMethod(target, originalSelector),
        let swizzledMethod = class_getInstanceMethod(target, newSelector) else { return }
    
    let methodAdded = class_addMethod(target, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    
    if methodAdded {
        class_replaceMethod(target, newSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}

extension UIViewController {
    static let swizzle: Void = {
        _swizzle(#selector(UIViewController.viewWillLayoutSubviews),
                 to: #selector(cui_viewWillLayoutSubviews),
                 in: UIViewController.self)
        
        _swizzle(#selector(UIViewController.willTransition(to:with:)),
                 to: #selector(cui_willTransition(to:with:)),
                 in: UIViewController.self)
        
        _swizzle(#selector(UIViewController.viewWillTransition(to:with:)),
                 to: #selector(cui_viewWillTransition(to:with:)),
                 in: UIViewController.self)
    }()
    
    @objc func cui_viewWillLayoutSubviews() {
        self.cui_viewWillLayoutSubviews()
        view.deactivate()
        view.activate()
    }
    
    @objc func cui_willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        self.cui_willTransition(to: newCollection, with: coordinator)
        CodeUI.shared.adoptToNewSizeClasses(h: newCollection.horizontalSizeClass, v: newCollection.verticalSizeClass)
    }
    
    @objc func cui_viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.cui_viewWillTransition(to: size, with: coordinator)
        CodeUI.shared.adoptToNewSize(CGSize(width: size.width * UIScreen.main.scale, height: size.height * UIScreen.main.scale))
    }
}

