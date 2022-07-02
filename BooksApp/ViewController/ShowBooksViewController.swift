//
//  ShowBooksViewController.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import UIKit
import Alamofire

class ShowBooksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiService.fetchBooks()
    }
}

class ApiService {
  static func fetchBooks() {
      AF.request("http://95.79.101.224:8000/firstapp/books/").validate().responseDecodable(of: BooksModel.self) { response in
          switch response.result {
          case .success(let value): print(value)
          case .failure(let error): print(error)
          }
      }
  }
  }
