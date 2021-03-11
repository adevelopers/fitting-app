//
//  RegisterCoordinator.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import UIKit
import Swinject


protocol RegisterFlow {
    func openDiscover()
}

class RegisterCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    var container: Container
    
    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        let viewModel = RegisterViewModel(service: RegisterService())
        let controller = container.resolve(RegisterViewProtocol.self, argument: viewModel)!
        viewModel.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
}

extension RegisterCoordinator: RegisterFlow {
    func openDiscover() {
        MainCoordinator(navigationController: navigationController, container: container).start()
    }
}
