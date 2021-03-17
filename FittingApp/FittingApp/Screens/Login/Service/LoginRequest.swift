//
//  LoginRequest.swift
//  FittingApp
//
//  Created by Maxim Safronov on 12.03.2021.
//

import Foundation
import Alamofire

enum Login {
    struct Request: Codable {
        let login: String
        let password: String
    }
    
    struct Response: Codable {
        let message: String
        let result: Int
        let token: String?
    }
}

class LoginRequest: AbstractRequestFactory {
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

extension LoginRequest: LoginRequestFactory {
    func login(email: String, password: String, completionHandler: @escaping (AFDataResponse<Login.Response>) -> Void) {
        let requestModel = LoginRequestRouter(baseUrl: baseUrl,
                                 login: email,
                                 password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension LoginRequest {
    struct LoginRequestRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "login"
        
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "login": login,
                "password": password
            ]
        }
    }
}

