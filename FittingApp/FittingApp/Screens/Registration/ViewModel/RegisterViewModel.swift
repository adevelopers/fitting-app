//
//  RegisterViewModel.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import Foundation


protocol RegisterViewModelInput {
    func didTapSignInButton(model: User)
}

class RegisterViewModel {
    var coordinator: RegisterFlow?
    var view: RegisterViewInput?
    
    private var userRequestFactory = RequestFactory().makeUserRequestFactory()
    
    private let service: RegisterServiceProtocol
    
    init(service: RegisterServiceProtocol) {
        self.service = service
    }

}

extension RegisterViewModel: RegisterViewModelInput {
    // Input
    func didTapSignInButton(model: User) {
        userRequestFactory.register(user: model) { [weak self] response in
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
