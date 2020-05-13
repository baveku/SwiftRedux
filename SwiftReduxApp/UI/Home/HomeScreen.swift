//
//  HomeScreen.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/9/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import UIKit

class HomeScreen: UIController<HomeViewModel> {
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarItem.title = "Home"
        self.tabBarItem.image = UIImage.icon(Icons.Tabbar.home)
    }
    @IBAction func clickButton(_ sender: UIButton) {
        self.viewModel?.buttonToggle()
    }
}
