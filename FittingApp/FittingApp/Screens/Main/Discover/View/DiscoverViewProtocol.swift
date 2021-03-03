//
//  DiscoverViewProtocol.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit


protocol DiscoverViewProtocol where Self: UIViewController {
    var viewModel: DiscoverViewModelInput? { get set }
}
