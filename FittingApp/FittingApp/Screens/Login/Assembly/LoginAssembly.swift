//
//  LoginAssembly.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import Swinject


struct LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginViewProtocol.self) { (resolver, viewModel: LoginViewModel) in
            let controller = LoginViewController()
            controller.viewModel = viewModel
            viewModel.view = controller
            return controller
        }
    }
}
