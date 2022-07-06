//
//  LoginViewController.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 04.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(myButton)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
    }
    
    private func setupConstraints() {
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 35).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -35).isActive = true
        loginTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        myButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        myButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    lazy var myButton: UIButton = {
        var configuration = UIButton.Configuration.gray() // 1
        configuration.cornerStyle = .capsule // 2
        configuration.baseForegroundColor = UIColor.systemPink
        configuration.buttonSize = .large
        configuration.title = "Gray Capsule"
        let button = UIButton(configuration: configuration, primaryAction: UIAction { _ in
            
            
            ApiService.loginPost(userName: "epoche", passWord: "epoche270296")
            
            print(ApiService.httpHeaders)
            ApiService.getAuthors { response in
                print(response)
            } failure: { error in
                print(error)
            }
            
            //let showBooksVC = ShowBooksViewController()
            //showBooksVC.view.backgroundColor = .white
            //self.navigationController?.pushViewController(showBooksVC, animated: true)
        })
        button.setTitle("Log in", for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Nickname",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemPink.withAlphaComponent(0.25)]
        )
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemPink.cgColor
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemPink.withAlphaComponent(0.25)]
        )
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemPink.cgColor
        return textField
    }()
}
