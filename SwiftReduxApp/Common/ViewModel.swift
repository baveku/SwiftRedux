//
//  ViewModable.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxRelay
import ReSwift

protocol ViewModelLifeCycle {
    func didLoad()
    func release()
}

protocol ViewModelProperty: StoreSubscriber {
    var disposeBag: DisposeBag? {get set}
    var loading: BehaviorRelay<Bool> {get set}
}

extension ViewModelProperty {
    var locator: DIContainer {
        return (UIApplication.shared.delegate as! AppDelegate).locator
    }
}

typealias ViewModable = ViewModelLifeCycle & ViewModelLifeCycle

/**
 ViewModel in MVVM-Redux
 This is handle business logic for UIController
 
 ViewModel auto subcribe to AppStore
 
 # Required
 You need handle selector to ViewModel know to use children State for Binding to Rx
 Require Selector
 ```
 func selector(_ state: AppState) -> S {
     // Tramsform from AppState to ViewModel State
 }
 ```
 
 # LifeCycle
 - Didload:
    - Auto Subcribe AppStore State
 - Release:
    - Unsubcribe, release Disposebag
 
 # Parameters:
 - S: is substate to use generic of ViewModel
*/
class ViewModel<S: StateType>: ViewModelProperty {
    var loading: BehaviorRelay<Bool> = .init(value: false)
    typealias StoreSubscriberStateType = S
    var disposeBag: DisposeBag? = DisposeBag()

    func selector(_ state: AppState) -> S {
        return state as! S
    }
    
    deinit {
        release()
    }
}

extension ViewModel {
    func newState(state: S) {}
    
    private func subcribes() {
        appStore.subscribe(self) { state in
            return state.select(self.selector)
        }
    }
    
    private func unsubcribe() {
        appStore.unsubscribe(self)
    }
}

extension ViewModel: ViewModelLifeCycle {
    func didLoad() {
        subcribes()
    }
    
    func release() {
        unsubcribe()
        disposeBag = nil
    }
}
