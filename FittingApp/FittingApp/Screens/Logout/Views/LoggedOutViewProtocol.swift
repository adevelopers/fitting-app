//
//  LoggedOutViewProtocol.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit

protocol LoggedOutViewProtocol where Self: UIViewController {
    var viewModel: LoggedOutViewModelInput? { get set }
}
