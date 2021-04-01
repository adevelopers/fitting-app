//
//  RegisterRequestFactory.swift
//  FittingApp
//
//  Created by Maxim Safronov on 01.04.2021.
//

import Foundation
import Alamofire

protocol RegisterRequestFactory: AbstractRequestFactory {
    func register(email: String, password: String, firstName: String, lastName: String, completionHandler: @escaping (AFDataResponse<Register.Response>) -> Void)
}
