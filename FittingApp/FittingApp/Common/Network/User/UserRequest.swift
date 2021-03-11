//
//  UserRequest.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import Foundation
import Alamofire

class UserRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    lazy var baseUrl = URL(string: "http://127.0.0.1:8080/user/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension UserRequest: UserRequestFactory {
    func login(email: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl,
                                 login: email,
                                 password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func register(user data: User, completion: @escaping (AFDataResponse<RegisterResult>) -> Void) {
        let requestModel = Register(baseUrl: baseUrl,
                                    login: data.login ?? "",
                                    password: data.password ?? "",
                                    firstName: data.firstName ?? "",
                                    lastName: data.lastName ?? "")
        
        self.request(request: requestModel, completionHandler: completion)
    }
}

extension UserRequest {
    struct Login: RequestRouter {
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
    
    struct Register: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "registration"
        
        let login: String
        let password: String
        let firstName: String
        let lastName: String?
        
        var parameters: Parameters? {
            return [
                "login": login,
                "password": password,
                "firstName": firstName,
                "lastName": lastName ?? ""
            ]
        }
    }
}
