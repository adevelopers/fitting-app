//
//  MainCoordinator.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit
import Swinject


protocol MainViewProtocol where Self: UITabBarController {
    
}

class MainCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    var container: Container
    
    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        let controller = container.resolve(MainViewProtocol.self)!
        let discoverViewModel = DiscoverViewModel()
        let discover = DiscoverCoordinator(navigationController: navigationController, container: container)
            .resolveController(viewModel: discoverViewModel)
        discover.tabBarItem = UITabBarItem(title: nil, image: .eyeImg, tag: 1)
        
        
        let searchViewModel = SearchViewModel()
        searchViewModel.discover = discoverViewModel
        let search = SearchCoordinator(navigationController: navigationController, container: container)
            .resolveController(viewModel: searchViewModel)
        search.tabBarItem = UITabBarItem(title: nil, image: .searchImg, tag: 2)
        
        controller.setViewControllers([
            discover,
            search
        ], animated: false)
        
        navigationController.pushViewController(controller, animated: true)
    }
}
