//
//  DiscoverAssembly.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import Swinject


struct DiscoverAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DiscoverViewProtocol.self) { (resolver, viewModel: DiscoverViewModel) in
            let controller = DiscoverViewController()
            viewModel.view = controller
            controller.viewModel = viewModel
            return controller
        }
    }
}
