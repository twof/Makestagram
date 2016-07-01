//
//  PostTableViewCell.swift
//  Makestagram
//
//  Created by fnord on 6/29/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import Bond
import Parse

class PostTableViewCell: UITableViewCell {

    @IBOutlet var postImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likesImageIcon: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    
    var postDisposable: DisposableType?
    var likeDisposable: DisposableType?
    var post:Post? {
        didSet {
            
            postDisposable?.dispose()
            likeDisposable?.dispose()
            // free memory of image stored with post that is no longer displayed
            // 1
            if let oldValue = oldValue where oldValue != post {
                // 2
                oldValue.image.value = nil
            }
            
            if let post = post {
                postDisposable = post.image.bindTo(postImageView.bnd_image)
                
                likeDisposable = post.likes.observe { (value: [PFUser]?) -> () in
                    if let value = value {
                        self.likesLabel.text = self.stringFromUserList(value)
                        self.likeButton.selected = value.contains(PFUser.currentUser()!)
                        self.likesImageIcon.hidden = (value.count == 0)
                    } else {
                        self.likesLabel.text = ""
                        self.likeButton.selected = false
                        self.likesImageIcon.hidden = true
                    }
                }
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
        post?.toggleLikePost(PFUser.currentUser()!)
    }
    
    @IBAction func moreButtonTapped(sender: AnyObject) {
        
    }

    func stringFromUserList(userList: [PFUser]) -> String {
        // 1
        let usernameList = userList.map { user in user.username! }
        // 2
        let commaSeparatedUserList = usernameList.joinWithSeparator(", ")
        
        return commaSeparatedUserList
    }
}
