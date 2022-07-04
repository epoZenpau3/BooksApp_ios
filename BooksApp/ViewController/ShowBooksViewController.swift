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
        self.navigationController?.navigationBar.topItem?.title = "rggr"
        setupViews()
        setupConstraints()
    }
    
    fileprivate func getBooks() {
        ApiService.getBooks { booksFrom in
            guard let books = booksFrom else  { return }
            for book in books {
                print(book)
            }
        } failure: { error in print(error ?? "failure")
        }
        ApiService.getAuthors { authors in
            guard let authors = authors else  { return }
            for author in authors {
                print(author)
            }
        } failure: { err in print(err ?? " ") }

    }
    
    lazy var myScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var myContentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    
    //TODO: Control Users Entry
    lazy var myButton: UIButton = {
        var configuration = UIButton.Configuration.gray() // 1
        configuration.cornerStyle = .capsule // 2
        configuration.baseForegroundColor = UIColor.systemPink
        configuration.buttonSize = .large
        configuration.title = "Gray Capsule"
        let button = UIButton(configuration: configuration,
                              primaryAction: UIAction { _ in
            guard let title = self.bookTitleTextField.text,
                  let bookColor = self.bookColorTextField.text,
                  let authorName = self.AuthorNameTextField.text,
                  let authorSName = self.AuthorSecondNameTextField.text else { return }
            let book = BookModel(title: title, color: bookColor)
            var books = BooksModel()
            books.append(book)
            ApiService.postAuthor(name: authorName, secondName: authorSName, books: books)
        })
        button.setTitle("Push me", for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var bookTitleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Book Title",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemPink.withAlphaComponent(0.25)]
        )
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemPink.cgColor
        return textField
    }()
    
    lazy var bookColorTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Book Color",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemPink.withAlphaComponent(0.25)]
        )
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemPink.cgColor
        return textField
    }()
    
    lazy var AuthorNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Author Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemPink.withAlphaComponent(0.25)]
        )
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemPink.cgColor
        return textField
    }()
    
    lazy var AuthorSecondNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Author Second Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemPink.withAlphaComponent(0.25)]
        )
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemPink.cgColor
        return textField
    }()
    
    fileprivate func setupViews() {
        view.addSubview(myScrollView)
        myScrollView.addSubview(myContentView)
        myContentView.addSubview(bookTitleTextField)
        myContentView.addSubview(bookColorTextField)
        myContentView.addSubview(AuthorNameTextField)
        myContentView.addSubview(AuthorSecondNameTextField)
        myContentView.addSubview(myButton)
    }
    
    fileprivate func setupConstraints() {
        myScrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant:0).isActive = true
        myScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        myScrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        myScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        myScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        myContentView.centerXAnchor.constraint(equalTo: myScrollView.centerXAnchor).isActive = true
        myContentView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor).isActive = true
        myContentView.topAnchor.constraint(equalTo: myScrollView.topAnchor).isActive = true
        myContentView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor).isActive = true
        
        bookTitleTextField.leftAnchor.constraint(equalTo: myContentView.leftAnchor, constant:20).isActive = true
        bookTitleTextField.topAnchor.constraint(equalTo: myContentView.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        bookTitleTextField.rightAnchor.constraint(equalTo: myContentView.rightAnchor, constant: -20).isActive = true
        bookTitleTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bookColorTextField.leftAnchor.constraint(equalTo: myContentView.leftAnchor, constant:20).isActive = true
        bookColorTextField.topAnchor.constraint(equalTo: bookTitleTextField.bottomAnchor, constant: 20).isActive = true
        bookColorTextField.rightAnchor.constraint(equalTo: myContentView.rightAnchor, constant: -20).isActive = true
        bookColorTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        AuthorNameTextField.leftAnchor.constraint(equalTo: myContentView.leftAnchor, constant:20).isActive = true
        AuthorNameTextField.topAnchor.constraint(equalTo: bookColorTextField.bottomAnchor, constant: 20).isActive = true
        AuthorNameTextField.rightAnchor.constraint(equalTo: myContentView.rightAnchor, constant: -20).isActive = true
        AuthorNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        AuthorSecondNameTextField.leftAnchor.constraint(equalTo: myContentView.leftAnchor, constant:20).isActive = true
        AuthorSecondNameTextField.topAnchor.constraint(equalTo: AuthorNameTextField.bottomAnchor, constant: 20).isActive = true
        AuthorSecondNameTextField.rightAnchor.constraint(equalTo: myContentView.rightAnchor, constant: -20).isActive = true
        AuthorSecondNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        myButton.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 20).isActive = true
        myButton.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor, constant: -20).isActive = true
        myButton.topAnchor.constraint(equalTo: AuthorSecondNameTextField.bottomAnchor, constant: 20).isActive = true
        myButton.bottomAnchor.constraint(equalTo: myContentView.bottomAnchor, constant: -70).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}


