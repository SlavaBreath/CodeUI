//
//  OptionSetExtension.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 6/19/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import Foundation

extension OptionSet where Self == Self.Element, Self.RawValue == Int {
    func isSatisfying(_ other: Self) -> Bool {
        return intersection(other).rawValue != 0
    }
}
