//
//  RegisterViewProtocol.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import UIKit


protocol RegisterViewProtocol where Self: UIViewController {
    var viewModel: RegisterViewModelInput? { get set }
}


protocol RegisterViewInput {
    func showError(msg: String)
}
