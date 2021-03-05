//
//  SearchViewProtocol.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 04.03.2021.
//

import UIKit

protocol SearchViewProtocol where Self: UIViewController {
    var viewModel: SearchViewModelInput? { get set }
}
