//
//  Home.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import SwiftUI

struct Home: View {
    @StateObject private var viewModel = HackerNewsViewModel()
    
    var body: some View {
        TabView {
            NewsListView(title: "New Stories", items: viewModel.stories)
                .tabItem {
                    Label("New", systemImage: "doc.text")
                }
                .onAppear {
                    viewModel.fetchItems(for: "new")
                }
            
            NewsListView(title: "Job Posts", items: viewModel.jobs)
                .tabItem {
                    Label("Jobs", systemImage: "briefcase")
                }
                .onAppear {
                    viewModel.fetchItems(for: "job")
                }
            
            NewsListView(title: "Ask HN", items: viewModel.asks)
                .tabItem {
                    Label("Ask HN", systemImage: "questionmark.circle")
                }
                .onAppear {
                    viewModel.fetchItems(for: "ask")
                }
        }
    }
}

#Preview {
    Home()
}
