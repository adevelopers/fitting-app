//
//  DiscoverCoordinator.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit
import Swinject

protocol DiscoverFlow {
    func openSearch()
}

class DiscoverCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    var container: Container
    
    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {}
    
    func resolveController(viewModel: DiscoverViewModel) -> UIViewController {
        let controller = container.resolve(DiscoverViewProtocol.self, argument: viewModel)!
        viewModel.coordinator = self
        return controller
    }
    
}

extension DiscoverCoordinator: DiscoverFlow {
    func openSearch() {
        
    }
}
