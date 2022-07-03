//
//  AuthorModel.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 03.07.2022.
//


import Foundation

typealias AuthorsModel = [AuthorModel]

struct AuthorModel: Codable {
    let id: Int
    let name, secondName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case secondName = "second_name"
    }
}



