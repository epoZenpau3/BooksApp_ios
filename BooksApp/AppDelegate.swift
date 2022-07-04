//
//  AppDelegate.swift
//  BooksApp
//
//  Created by Dmitriy Nikitin on 02.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let initialViewController = LoginViewController()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemPink
        ]
        //2
        UINavigationBar.appearance().titleTextAttributes = attributes
        initialViewController.title = "Log in"
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window?.rootViewController = navigationController
        return true
    }
}

