//
//  LoginViewModel.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import Foundation


protocol LoginViewModelInput {
    func didTapSignInButton()
}

class LoginViewModel {
    var coordinator: LoginFlow?
    
    // Output View
}

extension LoginViewModel: LoginViewModelInput {
    // Input
    func didTapSignInButton() {
        coordinator?.openDiscover()
    }
    
}
