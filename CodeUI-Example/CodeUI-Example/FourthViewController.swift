//
//  FourthViewController.swift
//  CodeUI-Example
//
//  Created by Vyacheslav Nagornyak on 7/9/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

final class FourthViewController: BaseViewController {
    private let topLeftView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 1, green: 0.1682408559, blue: 0.1936460323, alpha: 0.8702409771)
        return v
    }()
    
    private let bottomRightView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDescription("Two views inside view safe area with 8 offset\nEqual heights verticaly positioned in portrait\nEqual width horizontaly oriented in landscape")
        
        view.add(topLeftView, bottomRightView)
        
        topLeftView.cui
            .leading(view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
            .top(view.safeAreaLayoutGuide.topAnchor, constant: 8)
            .portrait()
            .trailing(view.safeAreaLayoutGuide.trailingAnchor, constant: 8)
            .landscape()
            .bottom(view.safeAreaLayoutGuide.bottomAnchor, constant: 8)
        
        bottomRightView.cui
            .trailing(view.safeAreaLayoutGuide.trailingAnchor, constant: 8)
            .bottom(view.safeAreaLayoutGuide.bottomAnchor, constant: 8)
            .portrait()
            .leading(view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
            .top(topLeftView.bottomAnchor, constant: 8)
            .height(topLeftView.heightAnchor)
            .landscape()
            .top(view.safeAreaLayoutGuide.topAnchor, constant: 8)
            .leading(topLeftView.trailingAnchor, constant: 8)
            .width(topLeftView.widthAnchor)
    }
}
