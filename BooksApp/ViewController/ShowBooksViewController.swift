//
//  ShowBooksViewController.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import UIKit

class ShowBooksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiService.getBooks { booksFrom in
            guard let books = booksFrom else  { return }
            for book in books {
                book.printBook()
            }
        } failure: { error in
            print(error ?? "failure")
        }

        ApiService.postBook(title: "Black Tea", author: 2, color: "Yellow") { book in
            print(book ?? "success")
        } failure: { error in
            print(error ?? "failure")
        }
    }
}


