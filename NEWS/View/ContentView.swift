//
//  ContentView.swift
//  NEWS
//
//  Created by PIXEL on 02.04.2025.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading news...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage).foregroundColor(.red)
                } else {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: NewsDetailView(article: article)) {
                            NewsCell(article: article)
                        }
                    }
                    .refreshable {
                        await viewModel.fetchNews()
                    }
                }
            }
            .navigationTitle("News")
            .task {
                await viewModel.fetchNews()
            }
        }
    }
}

#Preview {
    ContentView()
}

