//
//  AppDelegate.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 02.03.2021.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let container: Container = Container()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        assembleDependecies()
        
        window = UIWindow()
        window?.backgroundColor = .white
        
        AppCoordinator(window: window, container: container).start()
        
        return true
    }
    
    private func assembleDependecies() {
        ModulesAssembly().assemble(container: container)
    }

}

struct ModulesAssembly: Assembly {
    
    func assemble(container: Container) {
        let modules: [Assembly] = [
            LoggedOutAssembly(),
            LoginAssembly(),
            DiscoverAssembly()
        ]
        modules.forEach {
            $0.assemble(container: container)
        }
    }
}
