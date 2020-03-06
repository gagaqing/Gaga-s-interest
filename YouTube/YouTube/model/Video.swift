//
//  Video.swift
//  YouTube
//
//  Created by GA GA on 2018/10/23.
//  Copyright © 2018 GA GA. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?
    
    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" {
            
        } else {
            super.setValue(value, forKey: key)
        }
    }
}

class Channel: NSObject {
    var name: String?
    var profile_image_name: String?
}
