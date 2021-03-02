//
//  AppDelegate.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 02.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.backgroundColor = .white
        window?.rootViewController = UINavigationController(rootViewController: UIViewController(nibName: nil, bundle: nil))
        window?.makeKeyAndVisible()
        
        return true
    }

}

