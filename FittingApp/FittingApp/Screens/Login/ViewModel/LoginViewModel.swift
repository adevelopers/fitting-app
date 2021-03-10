//
//  LoginViewModel.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import Foundation


protocol LoginViewModelInput {
    func didTapSignInButton(model: Login.RequestModel)
}

class LoginViewModel {
    var coordinator: LoginFlow?
    var view: LoginViewInput?
    
    private let service: LoginServiceProtocol
    
    
    init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    // Output View
}

extension LoginViewModel: LoginViewModelInput {
    // Input
    func didTapSignInButton(model: Login.RequestModel) {
        service.auth(model: model) { [weak self] result in
            switch result {
            case let .success(response):
                print("auth token for save in session: ", response.token ?? "")
                self?.coordinator?.openDiscover()
            case let .failure(error):
                //TODO: show error message
                self?.view?.showError(msg: "❌ \(error)")
            }
        
        }
    }
    
}
