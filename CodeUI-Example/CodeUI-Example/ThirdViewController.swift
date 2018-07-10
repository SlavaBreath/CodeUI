//
//  ThirdViewController.swift
//  CodeUI-Example
//
//  Created by Vyacheslav Nagornyak on 7/9/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

final class ThirdViewController: BaseViewController {
    private let topView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 1, green: 0.1682408559, blue: 0.1936460323, alpha: 0.8702409771)
        return v
    }()
    
    private let bottomView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDescription("Two views equal heights\nTop in superview with no insets\nBottom in view safe area with no insets")
        
        view.add(topView, bottomView)
        
        topView.cui.anchor(leading: view.leadingAnchor, top: view.topAnchor, trailing: view.trailingAnchor, inset: 0)
        bottomView.cui.anchor(leading: view.safeAreaLayoutGuide.leadingAnchor, top: topView.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, inset: 0).height(topView.heightAnchor)
    }
}
