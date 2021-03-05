//
//  AppCoordinator.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit
import Swinject


class AppCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    var container: Container
    
    private weak var window: UIWindow?
    
    init(window: UIWindow?, container: Container) {
        self.window = window
        self.container = container
        self.navigationController = NavigationController()
        setupNavigationBar()
    }
    
    func start() {
        window?.rootViewController = navigationController
        LoggedOutCoordinator(navigationController: navigationController, container: container).start()
        window?.makeKeyAndVisible()
    }
    
    private func setupNavigationBar() {
        // back button icon
        UINavigationBar.appearance().backIndicatorImage = .arrowBackImg
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = .arrowBackImg
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().barTintColor = .white
        
    }
    
}
