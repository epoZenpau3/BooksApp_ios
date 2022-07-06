//
//  API.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import Alamofire

class ApiService {
    
    static let baseURL = "http://95.79.101.224:8000"
    
    static var httpHeaders: HTTPHeaders = []
    
    static func getAuthors(completion: @escaping ((Authors?) -> Void), failure: @escaping ((Error?) -> Void)) {
        AF.request(baseURL + "/firstapp/author/", headers: httpHeaders).validate().responseDecodable(of: Authors.self) { response in
            switch response.result {
            case .success(let books): completion(books)
            case .failure(let error): print(error)
            }
        }
    }
    
    static func getBooks(completion: @escaping ((BooksModel?) -> Void),
                         failure: @escaping ((Error?) -> Void)) {
        AF.request(baseURL + "/firstapp/book/").validate().responseDecodable(of: BooksModel.self) { response in
            switch response.result {
            case .success(let value): completion(value)
            case .failure(let error): print(error)
            }
        }
    }
    
    static func postAuthor(name: String, secondName: String, books: BooksModel) {
        let author = Author(name: name, secondName: secondName, books: books)
        AF.request(baseURL + "/firstapp/book/create/", method: .post, parameters: author, encoder: JSONParameterEncoder.default).response { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error): print(error)
            }
        }
    }
    
    static func registrationPost() {
        let parameters = ["email" : "yaya@gmail.com", "username": "JOJOzz", "password" : "zazaza425"]
        AF.request(baseURL + "/auth/users/", method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value): print(value)
            case .failure(let error): print(error)
            }
        }
    }
    
    static func loginPost(userName: String, passWord: String) {
        let parameters = ["username": userName, "password" : passWord]
        AF.request(baseURL + "/auth/token/login", method: .post, parameters: parameters).responseDecodable(of: Token.self) { response in
            switch response.result {
            case .success(let result):
                print(result.token)
                httpHeaders = [ .authorization(username: userName,
                                                            password: passWord),
                                             .authorization(bearerToken:"Token " + result.token),
                                             .accept("application/json") ]
            case .failure(let error): print(error)
            }
        }
    }
}
