//
//  BaseViewController.swift
//  CodeUI-Example
//
//  Created by Vyacheslav Nagornyak on 7/9/18.
//  Copyright © 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    let descriptionLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.preferredFont(forTextStyle: .body)
        l.numberOfLines = 0
        l.layer.zPosition = .greatestFiniteMagnitude
        l.textAlignment = .center
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.add(descriptionLabel)
        descriptionLabel.cui.centerX(view).bottom(view.safeAreaLayoutGuide, constant: 20).leading(view.safeAreaLayoutGuide, constant: 8, relation: .greaterThanOrEqual)
    }
    
    final func configureDescription(_ text: String, color: UIColor = .black) {
        descriptionLabel.text = text
        descriptionLabel.textColor = color
    }
}
