//
//  NewsArticle.swift
//  NEWS
//
//  Created by PIXEL on 02.04.2025.
//

import Foundation

struct NewsArticle: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String?
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    let url: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, description, urlToImage, publishedAt, content, url
    }
}

struct NewsResponse: Codable {
    let articles: [NewsArticle]
}
