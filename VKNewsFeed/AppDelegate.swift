//
//  AppDelegate.swift
//  VKNewsFeed
//
//  Created by Macbook on 18.12.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import UIKit
import VKSdkFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AuthServiceDelegate {

    var window: UIWindow?

    var authService: AuthService!

    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        self.authService = AuthService()

        authService.delegate = self

        let authVC: AuthViewController = AuthViewController.loadFromStoryboard()

        window?.rootViewController = authVC
        window?.makeKeyAndVisible()
        return true
    }

    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        return true
    }

    // MARK: AuthServiceDelegate
    func authServiceShouldShow(_ viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }

    func authServiceSignIn() {
        print(#function)
        let feedVC: NewsfeedViewController = NewsfeedViewController.loadFromStoryboard()
        let navigationVC = UINavigationController(rootViewController: feedVC)
        window?.rootViewController = navigationVC
    }

    func authServiceDidSignInFail() {
        print(#function)
    }
}

