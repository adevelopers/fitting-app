//
//  LoginCoordinator.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit
import Swinject


protocol LoginFlow {
    func openDiscover()
}

class LoginCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    var container: Container
    
    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        let viewModel = LoginViewModel()
        let controller = container.resolve(LoginViewProtocol.self, argument: viewModel)!
        viewModel.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
}

extension LoginCoordinator: LoginFlow {
    func openDiscover() {
        MainCoordinator(navigationController: navigationController, container: container).start()
    }
}
