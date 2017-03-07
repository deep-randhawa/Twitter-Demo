//
//  ProfileViewController.swift
//  Twitter-Demo
//
//  Created by Deep S Randhawa on 3/6/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var tweetContainerView: UIView!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followingContainerView: UIView!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followerContainerView: UIView!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    
    // GLOBAL VARS
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundImageView.setImageWith((user?.profileBackgroundImageURL)!)
        profileImageView.setImageWith((user?.profileImageURL)!)
        
        usernameLabel.text = user?.name
        displayNameLabel.text = "@\((user?.screenName)!)"
        
        profileImageView.layer.cornerRadius = 5
        profileImageView.clipsToBounds = true
        
        tweetCountLabel.text = "\((user?.retweetCount)!)"
        followingCountLabel.text = "\((user?.friendsCount)!)"
        followersCountLabel.text = "\((user?.followersCount)!)"
        
        tweetContainerView.layer.borderWidth = 0.5
        tweetContainerView.layer.borderColor = UIColor.gray.cgColor
        
        followingContainerView.layer.borderWidth = 0.5
        followingContainerView.layer.borderColor = UIColor.gray.cgColor
        
        followerContainerView.layer.borderWidth = 0.5
        followerContainerView.layer.borderColor = UIColor.gray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
