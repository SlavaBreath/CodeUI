//
//  FirstViewController.swift
//  CodeUI-Example
//
//  Created by Vyacheslav Nagornyak on 6/21/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

final class FirstViewController: BaseViewController {
    private let redView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 1, green: 0.1682408559, blue: 0.1936460323, alpha: 0.8702409771)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDescription("Simple view inside other view with zero offset", color: .white)
        
        view.add(redView)
        redView.cui.anchor(to: view)
    }
}

