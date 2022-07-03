//
//  API.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import Alamofire

class ApiService {
    
    static let baseURL = "http://95.79.101.224:8000/firstapp/"
    
    static func getBooks(completion: @escaping (([BookModel]?) -> Void), failure: @escaping ((Error?) -> Void)) {
        AF.request(baseURL + "books/").validate().responseDecodable(of: [BookModel].self) { response in
            switch response.result {
            case .success(let value): completion(value)
            case .failure(let error): print(error)
            }
        }
    }
    
    static func getAuthors(completion: @escaping (([AuthorModel]?) -> Void),
                           failure: @escaping ((Error?) -> Void)) {
        AF.request(baseURL + "authors/").validate().responseDecodable(of: [AuthorModel].self) { response in
            switch response.result {
            case .success(let value): completion(value)
            case .failure(let error): print(error)
            }
        }
    }
    
    static func postBook(title: String,
                         author: Int,
                         color: String,
                         completion: @escaping((BookModel?) -> Void),
                         failure: @escaping((Error?) -> Void)) {
        
        let book = BookForPost(author: author, title: title, color: color)
        
        AF.request(baseURL + "books/create/", method: .post, parameters: book, encoder: JSONParameterEncoder.default).response { response in
            print(response)
        }
    }
    
    static func postAuthor() {
        
    }
}
