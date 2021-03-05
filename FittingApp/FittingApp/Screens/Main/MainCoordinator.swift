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
        
        let discover = DiscoverCoordinator(navigationController: navigationController, container: container).resolveController()
        discover.tabBarItem = UITabBarItem(title: nil, image: UIImage.eyeImg, tag: 1)
        
        let search = SearchCoordinator(navigationController: navigationController, container: container).resolveController()
        search.tabBarItem = UITabBarItem(title: nil, image: .searchImg, tag: 2)
        
        controller.setViewControllers([
            discover,
            search
        ], animated: false)
        
        navigationController.pushViewController(controller, animated: true)
    }
}
