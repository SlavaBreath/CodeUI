//
//  Configuration.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 5/24/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import Foundation

enum Configuration: Hashable {
    case device(size: iOSDeviceSize, orientation: Orientation)
    case except(size: iOSDeviceSize, orientation: Orientation)
    
    var size: iOSDeviceSize {
        switch self {
        case .device(let size, _), .except(let size, _):
            return size
        }
    }
    
    var orientation: Orientation {
        switch self {
        case .device(_, let orientation), .except(_, let orientation):
            return orientation
        }
    }
    
    static let `default`: Configuration = .device(size: .any, orientation: .any)
    
    func isSatisfying(_ configuration: Configuration) -> Bool {
        switch self {
        case .device(let size, let orientation):
            return size.isSatisfying(configuration.size) && orientation.isSatisfying(configuration.orientation)
        case .except(let size, let orientation):
            let sizeFits = size.isSatisfying(configuration.size)
            return sizeFits || (!sizeFits && orientation.isSatisfying(configuration.orientation))
        }
    }
}
