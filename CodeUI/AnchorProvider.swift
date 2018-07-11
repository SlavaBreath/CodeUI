//
//  AnchorProvider.swift
//  CodeUI
//
//  Created by Vyacheslav Nagornyak on 7/11/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

public protocol AnchorProvider: class {
    var leading: NSLayoutXAxisAnchor? { get }
    var left: NSLayoutXAxisAnchor? { get }
    var trailing: NSLayoutXAxisAnchor? { get }
    var right: NSLayoutXAxisAnchor? { get }
    var top: NSLayoutYAxisAnchor? { get }
    var bottom: NSLayoutYAxisAnchor? { get }
    var centerX: NSLayoutXAxisAnchor? { get }
    var centerY: NSLayoutYAxisAnchor? { get }
    var width: NSLayoutDimension? { get }
    var height: NSLayoutDimension? { get }
    var firstBaseLine: NSLayoutYAxisAnchor? { get }
    var lastBaseLine: NSLayoutYAxisAnchor? { get }
}

extension AnchorProvider {
    public var leading: NSLayoutXAxisAnchor? { return nil }
    public var left: NSLayoutXAxisAnchor? { return nil }
    public var trailing: NSLayoutXAxisAnchor? { return nil }
    public var right: NSLayoutXAxisAnchor? { return nil }
    public var top: NSLayoutYAxisAnchor? { return nil }
    public var bottom: NSLayoutYAxisAnchor? { return nil }
    public var centerX: NSLayoutXAxisAnchor? { return nil }
    public var centerY: NSLayoutYAxisAnchor? { return nil }
    public var width: NSLayoutDimension? { return nil }
    public var height: NSLayoutDimension? { return nil }
    public var firstBaseLine: NSLayoutYAxisAnchor? { return nil }
    public var lastBaseLine: NSLayoutYAxisAnchor? { return nil }
}

extension UIView: AnchorProvider {
    public var leading: NSLayoutXAxisAnchor? { return leadingAnchor }
    public var left: NSLayoutXAxisAnchor? { return leftAnchor }
    public var trailing: NSLayoutXAxisAnchor? { return trailingAnchor }
    public var right: NSLayoutXAxisAnchor? { return rightAnchor }
    public var top: NSLayoutYAxisAnchor? { return topAnchor }
    public var bottom: NSLayoutYAxisAnchor? { return bottomAnchor }
    public var centerX: NSLayoutXAxisAnchor? { return centerXAnchor }
    public var centerY: NSLayoutYAxisAnchor? { return centerYAnchor }
    public var width: NSLayoutDimension? { return widthAnchor }
    public var height: NSLayoutDimension? { return heightAnchor }
    public var firstBaseLine: NSLayoutYAxisAnchor? { return firstBaselineAnchor }
    public var lastBaseLine: NSLayoutYAxisAnchor? { return lastBaselineAnchor }
}

extension UILayoutGuide: AnchorProvider {
    public var leading: NSLayoutXAxisAnchor? { return leadingAnchor }
    public var left: NSLayoutXAxisAnchor? { return leftAnchor }
    public var trailing: NSLayoutXAxisAnchor? { return trailingAnchor }
    public var right: NSLayoutXAxisAnchor? { return rightAnchor }
    public var top: NSLayoutYAxisAnchor? { return topAnchor }
    public var bottom: NSLayoutYAxisAnchor? { return bottomAnchor }
    public var centerX: NSLayoutXAxisAnchor? { return centerXAnchor }
    public var centerY: NSLayoutYAxisAnchor? { return centerYAnchor }
    public var width: NSLayoutDimension? { return widthAnchor }
    public var height: NSLayoutDimension? { return heightAnchor }
}

extension NSLayoutXAxisAnchor: AnchorProvider {
    public var leading: NSLayoutXAxisAnchor? { return self }
    public var left: NSLayoutXAxisAnchor? { return self }
    public var trailing: NSLayoutXAxisAnchor? { return self }
    public var right: NSLayoutXAxisAnchor? { return self }
    public var centerX: NSLayoutXAxisAnchor? { return self }
}

extension NSLayoutYAxisAnchor: AnchorProvider {
    public var top: NSLayoutYAxisAnchor? { return self }
    public var bottom: NSLayoutYAxisAnchor? { return self }
    public var centerY: NSLayoutYAxisAnchor? { return self }
}

extension NSLayoutDimension: AnchorProvider {
    public var width: NSLayoutDimension? { return self }
    public var height: NSLayoutDimension? { return self }
}
