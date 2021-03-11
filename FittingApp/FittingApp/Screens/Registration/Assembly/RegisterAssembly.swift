//
//  RegisterAssembly.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import Swinject


struct RegisterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RegisterViewProtocol.self) { (resolver, viewModel: RegisterViewModel) in
            let controller = RegisterViewController()
            controller.viewModel = viewModel
            viewModel.view = controller
            return controller
        }
    }
}
