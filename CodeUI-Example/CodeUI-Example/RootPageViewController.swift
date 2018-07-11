//
//  RootPageViewController.swift
//  CodeUI-Example
//
//  Created by Vyacheslav Nagornyak on 7/9/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

final class RootPageViewController: UIPageViewController {
    private let source: [UIViewController] = [
        FirstViewController(),
        SecondViewController(),
        ThirdViewController(),
        FourthViewController(),
        FifthViewController()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        view.backgroundColor = .white
        
        if let first = source.first {
            setViewControllers([first], direction: .forward, animated: false, completion: nil)
        }
    }
}

extension RootPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = source.index(of: viewController),
            index > 0, index < source.count else { return nil }
        
        return source[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = source.index(of: viewController),
            index >= 0, index < source.count - 1 else { return nil }
        
        return source[index + 1]
    }
    
    
}
