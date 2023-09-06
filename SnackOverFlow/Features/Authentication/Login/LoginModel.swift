//
//  LoginModel.swift
//  SnackOverFlow
//
//  Created by Oğuz on 7.09.2023.
//

import Foundation

// MARK: - LoginRequest

struct LoginRequest: Encodable {
    let email, password: String
}
// MARK: - LoginResponse

struct LoginResponse: Codable {
    let token: String
}
