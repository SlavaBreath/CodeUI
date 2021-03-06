//
//  AppDelegate.swift
//  CodeUI-Example
//
//  Created by Vyacheslav Nagornyak on 6/21/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit
import CodeUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        CodeUI.shared.window = window
        window?.rootViewController = RootPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        window?.makeKeyAndVisible()
        return true
    }
}
