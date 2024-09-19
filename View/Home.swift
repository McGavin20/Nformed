//
//  Home.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = HackerNewsViewModel()
    @State private var selectedTab: ItemType = .news
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // News tab
            ItemListView(items: viewModel.newsItems, itemType: .news)
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
                .tag(ItemType.news)
            
            // Jobs tab
            ItemListView(items: viewModel.jobItems, itemType: .job)
                .tabItem {
                    Label("Jobs", systemImage: "briefcase")
                }
                .tag(ItemType.job)
            
            // Ask tab
            ItemListView(items: viewModel.askItems, itemType: .ask)
                .tabItem {
                    Label("Ask", systemImage: "questionmark.circle")
                }
                .tag(ItemType.ask)
        }
        .onAppear {
            viewModel.fetchAllItems()
        }
    }
}
