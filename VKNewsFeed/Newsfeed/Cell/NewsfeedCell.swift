//
//  NewsfeedCell.swift
//  VKNewsFeed
//
//  Created by Macbook on 21.12.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import Foundation
import UIKit

class NewsfeedCell: UITableViewCell {

    static let reuseId = "NewsfeedCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var postLabel: UILabel!
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UIImageView!
    @IBOutlet weak var viewsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
