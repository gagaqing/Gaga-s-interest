//
//  SubscriptionCell.swift
//  YouTube
//
//  Created by GA GA on 2018/10/25.
//  Copyright © 2018 GA GA. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    override func fetchVideos() {
        ApiService.shareInstance.fetchSubscriptionFeedVideos { videos in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
