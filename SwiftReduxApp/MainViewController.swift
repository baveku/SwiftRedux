//
//  ViewController.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let button = UIButton()
        self.view.addSubview(button)
        button.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
            maker.width.equalTo(60)
            maker.height.equalTo(20)
        }
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.tintColor = .blue
        button.addTarget(self, action: #selector(printLog), for: .touchUpInside)
    }
    
    @objc func printLog() {
        log.debug("HEELoo")
    }
}

