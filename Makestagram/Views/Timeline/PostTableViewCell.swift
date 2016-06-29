//
//  PostTableViewCell.swift
//  Makestagram
//
//  Created by fnord on 6/29/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import Bond

class PostTableViewCell: UITableViewCell {

    @IBOutlet var postImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likesImageIcon: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    var post: Post? {
        didSet {
            // 1
            if let post = post {
                //2
                // bind the image of the post to the 'postImage' view
                post.image.bindTo(postImageView.bnd_image)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func moreButtonTapped(sender: AnyObject) {
        
    }

}
