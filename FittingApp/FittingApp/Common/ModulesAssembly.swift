//
//  ModulesAssembly.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import Swinject


struct ModulesAssembly: Assembly {
    
    func assemble(container: Container) {
        let modules: [Assembly] = [
            LoggedOutAssembly(),
            LoginAssembly(),
            DiscoverAssembly(),
            MainAssembly(),
            SearchAssembly()
        ]
        modules.forEach {
            $0.assemble(container: container)
        }
    }
}
