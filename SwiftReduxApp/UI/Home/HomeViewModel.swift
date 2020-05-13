//
//  HomeViewModel.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/9/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation

class HomeViewModel: ViewModel<AppState> {
    override func selector(_ state: AppState) -> AppState {
        return state
    }
    
    func buttonToggle() {
        NSLog("HELLO GUY")
        print("HELLO GUY")
    }
}
