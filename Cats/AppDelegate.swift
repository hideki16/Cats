//
//  AppDelegate.swift
//  Cats
//
//  Created by gabriel hideki on 26/07/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController(rootViewController: CatsList(viewModel: CatsListDefaultViewModel(networkService: DefaultNetworkService())))
        window.rootViewController = nav
        
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

