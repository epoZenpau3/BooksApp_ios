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
        window?.backgroundColor = .orange
        window?.rootViewController = ShowBooksViewController()
        
        return true
    }
    
}

