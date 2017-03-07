//
//  TweetDetailViewController.swift
//  Twitter-Demo
//
//  Created by Deep S Randhawa on 3/6/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    // OUTLETS
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    
    // GLOBAL VARS
    var tweet: Tweet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        photoImageView.setImageWith((tweet?.user?.profileImageURL)!, placeholderImage: nil)
        usernameLabel.text = tweet?.user?.name
        displayNameLabel.text = "@\((tweet?.user?.screenName)!)"
        tweetTextLabel.text = tweet?.text
        timestampLabel.text = formatter.string(from: (tweet?.createdAt)!)
        retweetCountLabel.text = "\((tweet?.retweetCount)!) RETWEETS"
        favoriteCountLabel.text = "\((tweet?.favoriteCount)!) FAVORITES"
        
        let tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(TweetDetailViewController.userTappedProfileImage))
        photoImageView.addGestureRecognizer(tapGestureRecognizer)
        photoImageView.isUserInteractionEnabled = true
    }
    
    func userTappedProfileImage() {
        performSegue(withIdentifier: "TweetDetailVCToProfileVCSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRetweetButtonClicked(_ sender: Any) {
        if (tweet?.retweeted ?? false) {
            tweet?.unretweet()
            retweetButton.setImage(UIImage.init(named: "retweet-icon"), for: .normal)
        } else {
            tweet?.retweet()
            retweetButton.setImage(UIImage.init(named: "retweet-icon-green"), for: .normal)
        }
    }
    
    @IBAction func onFavoriteButtonClicked(_ sender: Any) {
        if (tweet?.favorited ?? false) {
            tweet?.unfavorite()
            favoriteButton.setImage(UIImage.init(named: "favor-icon"), for: .normal)
        } else {
            tweet?.favorite()
            favoriteButton.setImage(UIImage.init(named: "favor-icon-red"), for: .normal)
        }
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
