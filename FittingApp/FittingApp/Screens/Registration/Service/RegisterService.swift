//
//  RegisterService.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import Foundation

protocol RegisterServiceProtocol {
    func register(model: User, completion: @escaping (Result<RegisterResult, Error>) -> Void)
}

class RegisterService: RegisterServiceProtocol {
    
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
    
    func register(model: User, completion: @escaping (Result<RegisterResult, Error>) -> Void) {
        guard let model = try? getDemoModel(modelName: "auth_response_ok", modelType: RegisterResult.self)
        else {
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(model))
        }
    }
}
