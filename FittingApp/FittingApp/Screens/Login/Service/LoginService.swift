//
//  LoginService.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 10.03.2021.
//

import Foundation

enum Login {
    struct RequestModel: Encodable {
        let login: String
        let password: String
    }
    
    struct ResponseModel: Decodable {
        let message: String
        let result: Int
        let token: String?
    }
    
    enum APIError: Error {
        case noJsonFile
        case decode(msg: String)
        case server(msg: String)
    }
}

protocol LoginServiceProtocol {
    func auth(model: Login.RequestModel, completion: @escaping (Result<Login.ResponseModel, Error>) -> Void)
}

class LoginService: LoginServiceProtocol {
    
    typealias APIError = Login.APIError
    
    private func getDemoModel<T: Decodable>(modelName: String, modelType: T.Type) throws -> T {
            guard
                let jsonUrl = Bundle.main.url(forResource: modelName, withExtension: "json")
            else {
                throw APIError.noJsonFile
            }

            do {
                let data = try Data(contentsOf: jsonUrl)
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                throw APIError.decode(msg: "\(error)" )
            }
    }
    
    func auth(model: Login.RequestModel, completion: @escaping (Result<Login.ResponseModel, Error>) -> Void) {
        guard let model = try? getDemoModel(modelName: "auth_response_ok", modelType: Login.ResponseModel.self)
        else {
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(model))
        }
        // TODO: Заменить на реальный API
//        guard let model = try? getDemoModel(modelName: "auth_response_fail", modelType: Login.ResponseModel.self)
//        else {
//            return
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            completion(.failure(APIError.server(msg: model.message)))
//        }
    }
    
}
