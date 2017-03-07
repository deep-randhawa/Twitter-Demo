//
//  User.swift
//  Twitter-Demo
//
//  Created by Deep S Randhawa on 2/27/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit

class User: NSObject {

    var name: String?                       // name
    var screenName: String?                 // screen_name
    var profileImageURL: URL?               // profile_image_url_https
    var profileBackgroundImageURL: URL?     // profile_background_image_url_https
    var followersCount: Int?                // followers_count
    var retweetCount: Int?                  // listed_count
    var favoritesCount: Int?                // favourites_count
    var friendsCount: Int?                  // friends_count
    var tagLine: String?                    // description
    private var originalDictionary: Dictionary<String, Any>?
    
    static let userLoggedOutNotification: String = "UserLoggedOut"
    static let userDefaultKey: String = "currentUserData"
    private static var _currentUser: User?
    class var currentUser: User? {
        get {
            if (_currentUser == nil) {
                let defaults = UserDefaults.standard
                let userData = defaults.object(forKey: userDefaultKey) as? Data
                if let userData = userData {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: [])
                    _currentUser =  User.init(dictionary: dictionary as! Dictionary<String, Any>)
                }
            }
            return _currentUser
        }
        
        set(user) {
            _currentUser = user
            let defaults = UserDefaults.standard
            
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.originalDictionary!, options: [])
                defaults.set(data, forKey: userDefaultKey)
            } else {
                defaults.removeObject(forKey: userDefaultKey)
            }
            defaults.synchronize()
        }
    }
    
    init(dictionary: Dictionary<String, Any>) {
        self.originalDictionary = dictionary
        self.name = dictionary["name"] as? String
        self.screenName = dictionary["screen_name"] as? String
        if let profileURLString = dictionary["profile_image_url_https"] as? String {
            self.profileImageURL = URL.init(string: profileURLString)
        }
        if let profileBackgroundURLString = dictionary["profile_background_image_url_https"] as? String {
            self.profileBackgroundImageURL = URL.init(string: profileBackgroundURLString)
        }
        self.followersCount = dictionary["followers_count"] as? Int
        self.retweetCount = dictionary["listed_count"] as? Int
        self.favoritesCount = dictionary["favourites_count"] as? Int
        self.friendsCount = dictionary["friends_count"] as? Int
        self.tagLine = dictionary["description"] as? String
    }
    
}
