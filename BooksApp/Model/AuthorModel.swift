//
//  AuthorModel.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 03.07.2022.
//


import Foundation

struct Author: Codable {
    let name, secondName: String
    let books: BooksModel

    enum CodingKeys: String, CodingKey {
        case name
        case secondName = "second_name"
        case books
    }
}

typealias Authors = [Author]



