//
//  AbstractErrorParser.swift
//  FittingApp
//
//  Created by Maxim Safronov on 11.03.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
