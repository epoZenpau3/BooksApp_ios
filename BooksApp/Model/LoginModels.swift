//
//  LoginModels.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 05.07.2022.
//

import Foundation

struct Token: Codable {
    var token: String

    enum CodingKeys: String, CodingKey {
        case token = "auth_token"
    }
}
