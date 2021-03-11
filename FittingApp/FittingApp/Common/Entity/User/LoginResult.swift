//
//  LoginResult.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let token: String?
    let message: String
}
