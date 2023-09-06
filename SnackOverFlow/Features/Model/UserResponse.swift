//
//  UserResponse.swift
//  SnackOverFlow
//
//  Created by Oğuz on 6.09.2023.
//

import Foundation
// MARK: UserResponse

struct UsersResponse: Codable {
    let page, perPage, total, totalPages: Int?
    let data: [Datum]?
    let support: Support?
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per _page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}
//MARK: - Datum

struct Datum: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
// MARK: - Support

struct Support: Codable {
    let urI: String?
    let text: String?
}
