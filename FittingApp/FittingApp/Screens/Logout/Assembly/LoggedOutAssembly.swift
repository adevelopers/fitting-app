//
//  LoggedOutAssembly.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import Swinject


struct LoggedOutAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoggedOutViewProtocol.self) { resolver in
            return LoggedOutViewController()
        }
    }
}
