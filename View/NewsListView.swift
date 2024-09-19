//
//  NewsListView.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import SwiftUI

struct NewsListView: View {
    let title: String
    let items: [HNItem]

    var body: some View {
        NavigationView {
            List(items) { item in
                VStack(alignment: .leading) {
                    Text(item.title ?? "No Title")
                        .font(.headline)
                    Text("By: \(item.by ?? "Unknown")")
                        .font(.subheadline)
                    if let score = item.score {
                        Text("Score: \(score)")
                    }
                }
            }
            .navigationTitle(title)
        }
    }
}
