//
//  NewsViewModel.swift
//  NEWS
//
//  Created by PIXEL on 02.04.2025.
//

import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiKey = "218ebc275a20454992fcfbd7ff7df5e4"
    private let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey="
    
    func fetchNews() async {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: urlString + apiKey) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            articles = decodedResponse.articles
        } catch {
            errorMessage = "Failed to fetch news"
        }
        
        isLoading = false
    }
}
