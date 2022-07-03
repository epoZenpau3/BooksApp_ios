//
//  ShowBooksViewController.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import UIKit

class ShowBooksViewController: UIViewController {

    lazy var myButton: UIButton = {
        let button = UIButton()
        button.configuration = .gray()
        button.configuration?.title = "Hello"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)
        return button
    }()
    
    fileprivate func setupConstraints() {
        myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        myButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        myButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myButton)
        myButton.backgroundColor = .brown
        setupConstraints()
    }

    @objc func pressed() {
    
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


