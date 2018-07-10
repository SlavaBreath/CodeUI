//
//  CUIViewController.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 5/24/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

open class CUIViewController: UIViewController {
    open override func viewWillLayoutSubviews() {
        CodeUI.shared.activate()
        
        super.viewWillLayoutSubviews()
    }
    
    open override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        CodeUI.shared.adoptToNewSizeClasses(h: newCollection.horizontalSizeClass, v: newCollection.verticalSizeClass)
    }
    
    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        CodeUI.shared.adoptToNewSize(CGSize(width: size.width * UIScreen.main.scale, height: size.height * UIScreen.main.scale))
    }
    
    deinit {
        CodeUI.shared.removeViews(view)
    }
}
