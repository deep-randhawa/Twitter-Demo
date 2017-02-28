//
//  Tweet.swift
//  Twitter-Demo
//
//  Created by Deep S Randhawa on 2/27/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var user: User?
    var text: String?
    var createdAt: Date?
    var retweetCount: Int
    var favoriteCount: Int
    var favorited: Bool
    var retweeted: Bool
    
    init(dictionary: Dictionary<String, Any>) {
        
        if let userDictionary = dictionary["user"] as? NSDictionary {
            self.user = User.init(dictionary: userDictionary as! Dictionary<String, Any>)
        }
        
        if ((dictionary["retweeted"] as? String) == "false") {
            self.retweeted = false
        } else {
            self.retweeted = true
        }
        
        if ((dictionary["favorited"] as? String) == "false") {
            self.favorited = false
        } else {
            self.favorited = true
        }
        
        self.text = dictionary["text"] as? String
        self.retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        self.favoriteCount = (dictionary["favorite_count"] as? Int) ?? 0
        
        if let timestampString = dictionary["created_at"] as? String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            
            self.createdAt = dateFormatter.date(from: timestampString)
        }
    }
    
    class func tweetsFromArray(dictionaries: [Dictionary<String, Any>]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            tweets.append(Tweet.init(dictionary: dictionary))
        }
        
        return tweets
    }
}
