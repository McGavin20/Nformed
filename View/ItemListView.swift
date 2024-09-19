//
//  ItemListView.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import SwiftUI

struct ItemListView: View {
    let items: [HNItem]
    let itemType: ItemType
    
    var body: some View {
        List(items) { item in
            switch itemType {
            case .news:
                NewsItemView(item: item)
            case .job:
                JobItemView(item: item)
            case .ask:
                AskItemView(item: item)
            }
        }
        .navigationTitle(itemType.title)
    }
}

enum ItemType {
    case news
    case job
    case ask
    
    var title: String {
        switch self {
        case .news:
            return "News"
        case .job:
            return "Jobs"
        case .ask:
            return "Ask HN"
        }
    }
}

