//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Macbook on 19.12.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    private let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        networkService.getFeed()
    }

}
