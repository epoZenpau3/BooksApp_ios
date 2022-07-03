//
//  BooksModel.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import Foundation

typealias BooksModel = [BookModel]

struct BookModel: Decodable,Encodable {
    let id: Int
    let author: Int
    let title: String
    let color: String
    let authorFirstName: String?
    let authorSecondName: String?
    
    enum CodingKeys: String, CodingKey {
        case id, author, title, color
        case authorFirstName = "author_first_name"
        case authorSecondName = "author_second_name"
    }
    
    public func printBook() {
        print("title: " + title + ", author: " + String(author) + ", color: " + color)
    }
}

struct BookForPost: Encodable {
    let author: Int
    let title: String
    let color: String
}
