//
//  Coordinator.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit
import Swinject


protocol Coordinator {
    var container: Container { get }

    func start()
}

protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController { get }
}
