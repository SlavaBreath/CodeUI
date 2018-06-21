//
//  ViewLayout.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 5/24/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

struct ViewLayout {
    var layout = [Configuration: [NSLayoutConstraint]]()
    
    mutating func add(_ configuration: Configuration, constraint: NSLayoutConstraint) {
        if layout[configuration] == nil {
            layout[configuration] = []
        }
        
        layout[configuration]?.append(constraint)
    }
    
    func deactivate(for configuration: Configuration) {
        let layoutsToDisable = layout.filter { !$0.key.isSatisfying(configuration) }
        layoutsToDisable.values.forEach { $0.forEach { $0.isActive = false } }
    }

    func activate(for configuration: Configuration) {
        let layoutsToActivate = layout.filter { $0.key.isSatisfying(configuration) }
        layoutsToActivate.values.forEach { $0.forEach { $0.isActive = true } }
    }
}
