//
//  User.swift
//  Twitter-Demo
//
//  Created by Deep S Randhawa on 2/27/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit

class User: NSObject {

    var name: String?
    var screenName: String?
    var profileURL: URL?
    var tagLine: String?
    
    init(dictionary: Dictionary<String, Any>) {
        self.name = dictionary["name"] as? String
        self.screenName = dictionary["screen_name"] as? String
        if let profileURLString = dictionary["profile_image_url_https"] as? String {
            self.profileURL = URL.init(string: profileURLString)
        }
        self.tagLine = dictionary["description"] as? String
    }
    
}
