//
//  API.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import Alamofire

class ApiService {
    static var authorsDictionary: [Int: String] = [:]
    
    static let baseURL = "http://95.79.101.224:8000/firstapp/"
    
    static func getAuthors(completion: @escaping ((Authors?) -> Void), failure: @escaping ((Error?) -> Void)) {
        AF.request(baseURL + "author/").validate().responseDecodable(of: Authors.self) { response in
            switch response.result {
            case .success(let books): completion(books)
            case .failure(let error): print(error)
            }
        }
    }
    
    static func getBooks(completion: @escaping ((BooksModel?) -> Void),
                           failure: @escaping ((Error?) -> Void)) {
        AF.request(baseURL + "book/").validate().responseDecodable(of: BooksModel.self) { response in
            switch response.result {
            case .success(let value): completion(value)
            case .failure(let error): print(error)
            }
        }
    }
    
    static func postAuthor(name: String, secondName: String, books: BooksModel) {
        let author = Author(name: name, secondName: secondName, books: books)
        AF.request(baseURL + "book/create/", method: .post, parameters: author, encoder: JSONParameterEncoder.default).response { response in
            print(response)
        }
    }
}
