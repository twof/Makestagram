//
//  PostSectionHeaderView.swift
//  Makestagram
//
//  Created by fnord on 7/1/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class PostSectionHeaderView: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    var dateFormatter = NSDateFormatter()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var post: Post? {
        didSet {
            dateFormatter.locale = NSLocale.currentLocale()
            dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
            var formattedDate = dateFormatter.stringFromDate((post?.createdAt)!)
            if let post = post {
                usernameLabel.text = post.user?.username
                postTimeLabel.text = formattedDate
            }
        }
    }

}
