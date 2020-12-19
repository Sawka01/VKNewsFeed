//
//  AuthViewController.swift
//  VKNewsFeed
//
//  Created by Macbook on 19.12.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()

//        authService = AuthService()
        authService = AppDelegate.shared().authService
    }

    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }

}
