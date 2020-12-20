//
//  NewsfeedInteractor.swift
//  VKNewsFeed
//
//  Created by Macbook on 20.12.2020.
//  Copyright (c) 2020 Sawka uz. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }

    switch request {
    case .some:
        print(".some Interactor")
        presenter?.presentData(response: .some)
    case .getFeed:
        print(".getFeed Interactor")
        presenter?.presentData(response: .presentNewsfeed)
    }

  }
  
}
