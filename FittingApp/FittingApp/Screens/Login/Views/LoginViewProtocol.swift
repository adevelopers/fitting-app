//
//  LoginViewProtocol.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit


protocol LoginViewProtocol where Self: UIViewController {
    var viewModel: LoginViewModelInput? { get set }
}


protocol LoginViewInput {
    func showError(msg: String)
}
