//
//  Orientation.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 6/19/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

public struct Orientation: OptionSet, Hashable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let portrait = Orientation(rawValue: 1 << 0)
    public static let landscape = Orientation(rawValue: 1 << 1)
    public static let any: Orientation = [.portrait, .landscape]
}

extension CGSize {
    var orientation: Orientation {
        return width > height ? .landscape : .portrait
    }
}
