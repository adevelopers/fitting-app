//
//  LoginViewModel.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import Foundation


protocol LoginViewModelInput {
    func didTapSignInButton(model: Login.Request)
}

class LoginViewModel {
    var coordinator: LoginFlow?
    var view: LoginViewInput?
    private let userRequestFactory = RequestFactory().makeLoginRequestFactory()
}

extension LoginViewModel: LoginViewModelInput {
    // Input
    func didTapSignInButton(model: Login.Request) {
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
    }
}
