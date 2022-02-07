//
//  AppDelegate.swift
//  BookmarksUIKit
//
//  Created by Vasiliy Shannikov on 18.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var firstLaunch = UserDefaults.standard.bool(forKey: "firstLaunch")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        if !firstLaunch {
            window?.rootViewController = UINavigationController(rootViewController: WelcomeScreen())//WelcomeScreen()
        } else
        {
            window?.rootViewController = LinkList()
        }
       
//        window?.rootViewController = FirstBookmark()
 //       window?.rootViewController = LinkList()
        return true
    }



}

