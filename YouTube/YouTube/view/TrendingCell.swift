//
//  TrendingCell.swift
//  YouTube
//
//  Created by GA GA on 2018/10/25.
//  Copyright © 2018 GA GA. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    override func fetchVideos() {
        ApiService.shareInstance.fetchTrendingFeedVideos { videos in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
