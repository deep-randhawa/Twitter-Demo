//
//  LoginViewController.swift
//  Twitter-Demo
//
//  Created by Deep S Randhawa on 2/27/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginButton(_ sender: Any) {
        TwitterClient.sharedInstance?.deauthorize()
        TwitterClient.sharedInstance?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL.init(string: "twitterdemoapp://auth_callback"), scope: nil, success: { (requestToken: BDBOAuth1Credential?) in
            print("Reveived Request Token from Twitter")
            
            let authorizeURL = URL.init(string: TwitterClient.twitterAuthorizeURL + "?oauth_token=\((requestToken?.token)!)")
            UIApplication.shared.open(authorizeURL!, options: [:], completionHandler: nil)
            
        }, failure: { (error: Error?) in
            print("error: \(error?.localizedDescription)")
        })
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
