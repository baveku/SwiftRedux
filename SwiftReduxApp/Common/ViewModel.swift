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

private protocol ViewModelLifeCycle {
    func didLoad()
    func didAppear()
    func didDisappear()
    func release()
}

private protocol ViewModelProperty: StoreSubscriber {
    var disposeBag: DisposeBag? {get set}
    var loading: BehaviorRelay<Bool> {get set}
}

extension ViewModelProperty {
    var locator: DIContainer {
        return (UIApplication.shared.delegate as! AppDelegate).locator
    }
}

class ViewModel: ViewModelProperty {
    var loading: BehaviorRelay<Bool> = .init(value: false)
    typealias StoreSubscriberStateType = AppState
    var disposeBag: DisposeBag? = DisposeBag()

    deinit {
        release()
    }
}

extension ViewModel {
    func newState(state: AppState) {}
    
    func subcribes() {
        appStore.subscribe(self)
    }
    
    func unsubcribe() {
        appStore.unsubscribe(self)
    }
}

extension ViewModel: ViewModelLifeCycle {
    func didDisappear() {
        unsubcribe()
    }
    
    func didAppear() {
        subcribes()
    }
    
    func didLoad() {
           subcribes()
    }
    
    func release() {
       disposeBag = nil
       unsubcribe()
    }
}
