//
//  MainAssembly.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//


import Swinject

extension UITabBarController: MainViewProtocol {}

struct MainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MainViewProtocol.self) { resolver in
            let tabBarController = UITabBarController()
            tabBarController.tabBar.isTranslucent = false
            tabBarController.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tabBarController.tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            tabBarController.tabBar.unselectedItemTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            return tabBarController
        }
    }
}
