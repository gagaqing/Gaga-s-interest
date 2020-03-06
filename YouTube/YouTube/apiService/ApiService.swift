//
//  ApiService.swift
//  YouTube
//
//  Created by GA GA on 2018/10/25.
//  Copyright © 2018 GA GA. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let shareInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"

    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json", completion: completion)
    }
    
    func fetchTrendingFeedVideos(completion: @escaping ([Video]) -> ()) {

        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriptionFeedVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }
    
    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            do {
                
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: Any]] {
                    var videos = [Video]()
                    
                    for dictionary in jsonDictionaries {
                        let video = Video()
                        video.title = dictionary["title"] as? String
                        video.thumbnail_image_name = dictionary["thumbnail_image_name"] as? String
                        video.number_of_views = dictionary["number_of_views"] as? NSNumber
                        
                        let channelDictionary = dictionary["channel"] as! [String: Any]
                        let channel = Channel()
                        channel.name = channelDictionary["name"] as? String
                        channel.profile_image_name = channelDictionary["profile_image_name"] as? String
                        video.channel = channel
                        videos.append(video)
                    }
                    
                    DispatchQueue.main.async {
                        completion(videos)
                    }
                }
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }
    
}
