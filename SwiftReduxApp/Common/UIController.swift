//
//  UIController.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/10/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import ReSwift

/**
 UIController Without Xib file
 
 We can handle business logic on ViewModel
 UIController likes View, only hanle animtion
 
 - Init
     ```
     let viewModel = ProductsViewModel()
     let viewController = ProductsScreen(viewModel: viewModel)
     ```
- If Use xib file:
    - XibName must be equal Class Name
    - Example: class HomeScreen -> xib: HomeScreen.xib
    ```
     ProductsScreen(viewModel: viewModel, useInterfaceBuilder: true)
    ```
                
*/
class UIController<VM: ViewModable>: UIViewController {

    final var disposeBag: DisposeBag? = DisposeBag()
    private var _vm: VM?
    private var useInterfaceBuilder: Bool = false
    
    final var viewModel: VM? {
        return _vm
    }
    
    init(viewModel: VM? = nil, useInterfaceBuilder: Bool = false) {
        super.init(nibName: nil, bundle: nil)
        self._vm = viewModel
        self.useInterfaceBuilder = useInterfaceBuilder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        if useInterfaceBuilder {
            loadFromXib()
        } else {
            super.loadView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _vm?.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindingViewModel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.disposeBag = DisposeBag()
    }
    
    func bindingViewModel() {}
    
    
    
    private func loadFromXib() {
        self.view = Bundle.main.loadNibNamed(self.stringFromInstance, owner: self, options: nil)![0] as? UIView
    }
    
    func destroy() {
        self._vm?.release()
        self.disposeBag = nil
    }
    
    deinit {
        destroy()
    }
}
