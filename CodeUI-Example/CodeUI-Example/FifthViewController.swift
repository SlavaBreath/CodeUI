//
// Created by Vyacheslav Nagornyak on 7/10/18.
// Copyright (c) 2018 Vyacheslav Nagornyak. All rights reserved.
//

import UIKit

final class FifthViewController: UIViewController {
    let topBar: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return v
    }()
    
    let bottomBar: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.add([topBar, bottomBar])
        
        topBar.cui.leading(view).top(view).trailing(view).bottom(view.safeAreaLayoutGuide.topAnchor, constant: -64)
        bottomBar.cui.leading(view).top(view.safeAreaLayoutGuide.bottomAnchor, constant: -44).trailing(view).bottom(view)
    }
}
