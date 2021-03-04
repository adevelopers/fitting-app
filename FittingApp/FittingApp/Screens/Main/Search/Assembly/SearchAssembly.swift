//
//  SearchAssembly.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 04.03.2021.
//

import Swinject


struct SearchAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchViewProtocol.self) { (resolver, viewModel: SearchViewModel) in
            let controller = SearchViewController()
            viewModel.view = controller
            controller.viewModel = viewModel
            return controller
        }
    }
}
