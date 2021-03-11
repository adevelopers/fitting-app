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
    private let userRequestFactory = RequestFactory().makeUserRequestFactory()
    
    init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    // Output View
}

extension LoginViewModel: LoginViewModelInput {
    // Input
    func didTapSignInButton(model: Login.RequestModel) {
        userRequestFactory.login(email: model.login, password: model.password) { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let response):
                DispatchQueue.main.async {
                    switch response {
                    case (_) where response.result == 1:
                        print(response)
                        self.coordinator?.openDiscover()
                    default:
                        print(response)
                        self.view?.showError(msg: "❌ \(response.message)")
                    }
                }
            case .failure(_):
                
                print(response)
                self.view?.showError(msg: "❌ Ошибка!")
            }
        }
        /*
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
        */
    }
    
}
