//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Macbook on 26.12.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
