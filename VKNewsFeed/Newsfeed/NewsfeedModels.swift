//
//  NewsfeedModels.swift
//  VKNewsFeed
//
//  Created by Macbook on 20.12.2020.
//  Copyright (c) 2020 Sawka uz. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getFeed
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentNewsfeed
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayNewsfeed
      }
    }
  }
  
}
