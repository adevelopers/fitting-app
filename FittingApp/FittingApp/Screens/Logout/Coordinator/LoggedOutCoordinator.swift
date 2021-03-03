//
//  LoggedOutCoordinator.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit
import Swinject


protocol LoggedOutFlow {
    func login()
    func registration()
}

class LoggedOutCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    var container: Container
    
    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        let controller = container.resolve(LoggedOutViewProtocol.self)!
        let viewModel = LoggedOutViewModel()
        viewModel.coordinator = self
        controller.viewModel = viewModel
        navigationController.viewControllers = [controller]
    }
    
}

extension LoggedOutCoordinator: LoggedOutFlow {
    func login() {
        LoginCoordinator(navigationController: navigationController, container: container).start()
    }
    
    func registration() {
        
    }
}
