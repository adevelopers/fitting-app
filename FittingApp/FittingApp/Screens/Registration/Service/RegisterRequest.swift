//
//  RegisterService.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import Foundation
import Alamofire

enum Register {
    struct Request: Codable {
        let login: String
        let password: String
        let firstName: String
        let lastName: String
    }
    
    struct Response: Codable {
        let message: String
        let result: Int
        let token: String?
    }
}

class RegisterRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL = URL(string: "http://127.0.0.1:8080/user/")!
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension RegisterRequest: RegisterRequestFactory {
    func register(email: String, password: String, firstName: String, lastName: String, completionHandler: @escaping (AFDataResponse<Register.Response>) -> Void) {
        let requestModel = RegisterRequestRouter(baseUrl: baseUrl,
                                 login: email,
                                 password: password,
                                 firstName: firstName,
                                 lastName: lastName)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RegisterRequest {
    struct RegisterRequestRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "registration"
        
        let login: String
        let password: String
        let firstName: String
        let lastName: String
        var parameters: Parameters? {
            return [
                "login": login,
                "password": password,
                "firstName": firstName,
                "lastName": lastName
            ]
        }
    }
}
