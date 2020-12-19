//
//  UIViewController + Storyboard.swift
//  VKNewsFeed
//
//  Created by Macbook on 19.12.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import UIKit

extension UIViewController {

    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
}
