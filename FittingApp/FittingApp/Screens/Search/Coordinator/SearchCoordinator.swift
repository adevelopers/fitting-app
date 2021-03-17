//
//  SearchCoordinator.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 04.03.2021.
//

import UIKit
import Swinject

protocol SearchFlow {
    func openSearch()
}

class SearchCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    var container: Container
    
    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
//        let controller = resolveController()
//        navigationController.pushViewController(controller, animated: true)
    }
    
    func resolveController(viewModel: SearchViewModel) -> UIViewController {
        viewModel.coordinator = self
        let controller = container.resolve(SearchViewProtocol.self, argument: viewModel)!
        return controller
    }
    
}

extension SearchCoordinator: SearchFlow {
    func openSearch() {
        
    }
}
