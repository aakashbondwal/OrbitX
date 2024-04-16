//
//  NewsDataModel.swift
//  NewsApp
//
//  Created by Aakash  Bondwal  on 04/01/24.
//

import Foundation

//SpaceflightApi Articles
//This data model is same for both articles and blogs api
//https://api.spaceflightnewsapi.net/v4/articles
//https://api.spaceflightnewsapi.net/v4/blogs



struct ArticlesDataModel: Codable {
    let count: Int
    let next: String
    let results: [Results]
}

struct Results: Codable, Identifiable {
    let id: Int
    let title: String
    let url: String
    let image_url: String
    let news_site: String
    let summary: String
    let published_at: String
    let updated_at: String
    let featured: Bool
    let launches: [ArticleLaunches]
    let events: [ArticleEvents]
}

struct ArticleLaunches: Codable {
    let launch_id, provider: String
    
}


struct ArticleEvents: Codable {
    let event_id: Int
    let provider: String
}
