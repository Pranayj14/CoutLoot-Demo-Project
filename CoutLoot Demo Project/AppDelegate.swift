//
//  AppDelegate.swift
//  CoutLoot Demo Project
//
//  Created by Pranay Joshi on 23/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.makeKeyAndVisible()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        let mainVc = UINavigationController(rootViewController: vc)
        window?.rootViewController = mainVc
        return true
    }
}

