//
//  LoginRequestFactory.swift
//  FittingApp
//
//  Created by Maxim Safronov on 12.03.2021.
//

import Foundation
import Alamofire

protocol LoginRequestFactory: AbstractRequestFactory {
    func login(email: String, password: String, completionHandler: @escaping (AFDataResponse<Login.Response>) -> Void)
}
