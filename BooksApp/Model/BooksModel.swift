//
//  BooksModel.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import Foundation

struct BookModel: Decodable {
    let id: Int
    let author: Int
    let title: String
    let color: String
    let authorFirstName: String
    let authorSecondName: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, title, color
        case authorFirstName = "author_first_name"
        case authorSecondName = "author_second_name"
    }
}

typealias BooksModel = [BookModel]
