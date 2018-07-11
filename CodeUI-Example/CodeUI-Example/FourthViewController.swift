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
        
        configureDescription("Two views inside view safe area with 8 offset\nEqual heights vertically positioned in portrait\nEqual width horizontally positioned in landscape")
        
        view.add([topLeftView, bottomRightView])
        
        topLeftView.cui.anchor(leading: view.safeAreaLayoutGuide, top: view.safeAreaLayoutGuide, inset: 8)
            .portrait().trailing(view.safeAreaLayoutGuide, constant: 8)
            .landscape().bottom(view.safeAreaLayoutGuide, constant: 8)
        
        bottomRightView.cui.anchor(trailing: view.safeAreaLayoutGuide, bottom: view.safeAreaLayoutGuide, inset: 8)
            .portrait().anchor(leading: view.safeAreaLayoutGuide, top: topLeftView.bottomAnchor, inset: 8).height(topLeftView)
            .landscape().anchor(leading: topLeftView.trailingAnchor, top: view.safeAreaLayoutGuide, inset: 8).width(topLeftView)
    }
}
