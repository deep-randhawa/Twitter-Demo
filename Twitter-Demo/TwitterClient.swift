//
//  TwitterClient.swift
//  Twitter-Demo
//
//  Created by Deep S Randhawa on 2/27/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    
    // API ENDPOINTS
    static let homeTimelineEndpoint: String = "1.1/statuses/home_timeline.json"
    
    // GLOBAL VARS
    static let baseUrl: String = "https://api.twitter.com"
    static let twitterAuthorizeURL: String = "https://api.twitter.com/oauth/authorize"
    static let twitterConsumerKey: String = "yGpTFDRteUkCCxQThLGm8Alwf"
    static let twitterConsumerSecret: String = "Fhu4BOTGk2omcDS332x9LBtUM1fpqbCRZNqWFAzQizVdXTrdVV"
    
    static let sharedInstance = TwitterClient(baseURL: URL.init(string: baseUrl), consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
    
    // LOGIN CLOSURES
    var loginSuccess: (() -> ())?
    var loginFailure: ((Error) -> ())?
    
    func handleOpenURL(url: URL) {
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential?) in
            self.loginSuccess?()
        }, failure: { (error: Error?) in
            self.loginFailure?(error!)
        })

    }
    
    func login(success: @escaping () -> (), failure: @escaping (Error) -> ()) {
        loginSuccess = success
        loginFailure = failure
        
        TwitterClient.sharedInstance?.deauthorize()
        TwitterClient.sharedInstance?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL.init(string: "twitterdemoapp://auth_callback"), scope: nil, success: { (requestToken: BDBOAuth1Credential?) in
            print("Reveived Request Token from Twitter")
            
            let authorizeURL = URL.init(string: TwitterClient.twitterAuthorizeURL + "?oauth_token=\((requestToken?.token)!)")
            UIApplication.shared.open(authorizeURL!, options: [:], completionHandler: nil)
            
        }, failure: { (error: Error?) in
            print("error: \(error?.localizedDescription)")
            self.loginFailure?(error!)
        })
    }
    
    func homeTimeline(success: @escaping ([Tweet]) -> (), failure: @escaping (Error) -> ()) {
        get(TwitterClient.homeTimelineEndpoint, parameters: nil, progress: nil, success: { (URLSessionDataTask, response: Any?) in
            let dictionaries = response as! [Dictionary<String, Any>]
            let tweets = Tweet.tweetsFromArray(dictionaries: dictionaries)
            success(tweets)
        }) { (URLSessionDataTask, error: Error) in
            failure(error)
        }
    }

}
