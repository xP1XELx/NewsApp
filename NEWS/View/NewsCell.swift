//
//  NewsCell.swift
//  NEWS
//
//  Created by PIXEL on 02.04.2025.
//

import SwiftUI
import Kingfisher

struct NewsCell: View {
    let article: NewsArticle
    
    var body: some View {
        HStack {
            if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                if let description = article.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(article.publishedAt)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

