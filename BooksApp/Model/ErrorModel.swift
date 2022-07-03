//
//  ErrorModel.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 03.07.2022.
//

import Foundation

struct Error: Codable {
    let statusCode: Int?
    let error: String?
    let message: String?
}
