//
//  LoginViewModel.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import Foundation


protocol LoggedOutViewModelInput {
    func didTapLoginButton()
    func didTapRegButton()
}

class LoggedOutViewModel {
    var coordinator: LoggedOutFlow?
    
    // Output View
}

extension LoggedOutViewModel: LoggedOutViewModelInput {
    
    // Input
    func didTapLoginButton() {
        coordinator?.login()
    }
    
    func didTapRegButton() {
        coordinator?.registration()
    }
    
}
