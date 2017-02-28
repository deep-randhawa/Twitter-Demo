//
//  TweetCell.swift
//  Twitter-Demo
//
//  Created by Deep S Randhawa on 2/27/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    // OUTLETS
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
