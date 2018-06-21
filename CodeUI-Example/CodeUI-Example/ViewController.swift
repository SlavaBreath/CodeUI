//
//  ViewController.swift
//  CodeUI-Example
//
//  Created by Vyacheslav Nagornyak on 6/21/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit
import CodeUI

class ViewController: CUIViewController {
    private let firstView: UIView = {
        let v = UIView()
        v.backgroundColor = .orange
        return v
    }()
    
    private let firstLabel: UILabel = {
        let l = UILabel()
        l.text = "1"
        l.font = UIFont.systemFont(ofSize: 50)
        return l
    }()
    
    private let secondView: UIView = {
        let v = UIView()
        v.backgroundColor = .cyan
        return v
    }()
    
    private let secondLabel: UILabel = {
        let l = UILabel()
        l.text = "2"
        l.font = UIFont.systemFont(ofSize: 50)
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        firstView.add(firstLabel)
        firstLabel.cui.center(in: firstView)
        
        secondView.add(secondLabel)
        secondLabel.cui.leading(secondView.leadingAnchor, constant: 4).top(secondView.topAnchor, constant: 4)
        
        view.add(firstView, secondView)
        
        firstView.cui
            .portrait()
            .square()
            .landscape()
            .height(secondView.heightAnchor)
            .device(size: .iPhoneX, orientation: .portrait)
            .anchor(leading: view.leadingAnchor, top: view.safeAreaLayoutGuide.topAnchor, trailing: view.trailingAnchor, insets: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
            .device(size: .iPhoneX, orientation: .landscape)
            .anchor(leading: view.safeAreaLayoutGuide.leadingAnchor, top: view.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
            .except(size: .iPhoneX)
            .anchor(leading: view.safeAreaLayoutGuide.leadingAnchor, top: view.safeAreaLayoutGuide.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, inset: 8)
        
        secondView.cui
            .device(size: .iPhoneX, orientation: .landscape)
            .leading(view.safeAreaLayoutGuide.leadingAnchor)
            .top(firstView.bottomAnchor, constant: 4)
            .trailing(view.safeAreaLayoutGuide.trailingAnchor)
            .bottom(view.safeAreaLayoutGuide.bottomAnchor, constant: 4)
            .except(size: .iPhoneX, orientation: .landscape)
            .anchor(leading: view.safeAreaLayoutGuide.leadingAnchor, top: firstView.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, insets: UIEdgeInsets(top: 4, left: 8, bottom: 8, right: 8))
    }
}

