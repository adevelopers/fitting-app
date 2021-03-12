//
//  RequestFactory.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import Foundation
import Alamofire
import Swinject

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeLoginRequestFactory() -> LoginRequestFactory {
        let container = Container()
        
        container.register(AbstractErrorParser.self) { _ in ErrorParser() }
        container.register(LoginRequest.self) { resolver in
            LoginRequest(errorParser: resolver.resolve(AbstractErrorParser.self)!, sessionManager: self.commonSession)
        }
        
        return container.resolve(LoginRequest.self)!
    }
    
}
