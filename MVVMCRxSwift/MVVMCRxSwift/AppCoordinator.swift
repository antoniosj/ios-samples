//
//  AppCoordinator.swift
//  MVVMCRxSwift
//
//  Created by Antonio Silva on 16/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //tells to instantiate from the storyboard
        let viewController = ViewController.instantiate(viewModel: RestaurantsListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
