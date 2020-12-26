//
//  API.swift
//  VKNewsFeed
//
//  Created by Macbook on 19.12.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.126"

    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
}
