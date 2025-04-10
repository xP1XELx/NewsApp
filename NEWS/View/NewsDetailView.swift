//
//  NewsDetailView.swift
//  NEWS
//
//  Created by PIXEL on 02.04.2025.
//

import SwiftUI
import Kingfisher

struct NewsDetailView: View {
    let article: NewsArticle
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                    KFImage(url)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                }
                
                Text(article.title)
                    .font(.title)
                    .bold()
                
                if let content = article.content {
                    Text(content)
                        .font(.body)
                }
                
                if let url = article.url, let articleURL = URL(string: url) {
                    Link("Read more", destination: articleURL)
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .navigationTitle("News Detail")
        .toolbar {
            ShareLink(item: URL(string: article.url ?? "")!)
        }
    }
}

