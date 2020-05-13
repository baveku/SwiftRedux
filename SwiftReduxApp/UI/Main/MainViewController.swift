//
//  ViewController.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import UIKit
import SnapKit

class MainTabbar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        setupChildControllers()
    }
    
    func setupChildControllers() {
        let homeViewModel = HomeViewModel()
        let home = HomeScreen(viewModel: homeViewModel, useInterfaceBuilder: true)
        viewControllers = [home]
    }
}

