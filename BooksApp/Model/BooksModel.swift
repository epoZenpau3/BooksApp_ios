//
//  BooksModel.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import Foundation

struct BookModel: Codable {
    let title: String
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case title, color
    }
    
    init(title: String, color: String) {
        self.title = title
        self.color = color
    }
    
    public func printBook() {
        print("title: " + title + ", color: " + color)
    }
}

typealias BooksModel = [BookModel]

