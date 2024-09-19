//
//  NewsListView.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import SwiftUI

struct NewsListView: View {
    let title: String
    let items: [HNItem] // This would be your array of Hacker News items fetched from the API

    var body: some View {
        NavigationView {
            List(items) { item in
                NewsItemView(item: item) // Pass the item to the NewsItemView
            }
            .navigationTitle(title)
        }
    }
}
