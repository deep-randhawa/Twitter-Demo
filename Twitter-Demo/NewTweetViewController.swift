//
//  NewTweetViewController.swift
//  Twitter-Demo
//
//  Created by Deep S Randhawa on 3/7/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!
    
    // GLOBAL VARS
    let user: User = User.currentUser!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImageView.setImageWith(user.profileImageURL!)
        usernameLabel.text = user.name!
        displayNameLabel.text = "@\(user.screenName!)"
        tweetTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userSubmittedNewStatus(_ sender: Any) {
        // TODO: submit statuses to Twitter through TwitterClient
        let statusParamter: [String: String] = ["status": tweetTextView.text]
        TwitterClient.sharedInstance?.statusUpdate(success: { (user: User) in
            print("successfully added new tweet")
        }, failure: { (error: Error) in
            print(error.localizedDescription)
        }, json: statusParamter)
        
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
