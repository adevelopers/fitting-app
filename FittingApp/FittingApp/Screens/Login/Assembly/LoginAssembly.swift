//
//  LoginAssembly.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import Swinject


struct LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginViewProtocol.self) { resolver in
            return LoginViewController()
        }
    }
}
