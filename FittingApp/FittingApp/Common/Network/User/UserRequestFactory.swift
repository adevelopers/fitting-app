//
//  UserRequestFactory.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import Foundation
import Alamofire

protocol UserRequestFactory: AbstractRequestFactory {
    func login(email: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    
    func register(user data: User, completion: @escaping (AFDataResponse<RegisterResult>) -> Void)
}
