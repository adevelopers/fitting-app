//
//  LoggedOutCoordinator.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit
import Swinject


class LoggedOutCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    var container: Container
    
    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        let controller = container.resolve(LoggedOutView.self)!
        navigationController.viewControllers = [controller]
    }
    
    
}
