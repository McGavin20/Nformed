//
//  AskItemView.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import SwiftUI

struct AskItemView: View {
    let item: HNItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title ?? "No Title")
                .font(.headline)
                .lineLimit(2)

            HStack {
                Text("Author: \(item.by ?? "Unknown")")
                    .font(.subheadline)
                Spacer()
                Text("Posted: \(formatUnixDate(item.time ?? 0))")
                    .font(.subheadline)
            }
        }
        .padding(.leading, 8)
        .contentShape(Rectangle())
        .onTapGesture {
            if let url = URL(string: item.url ?? "") {
                UIApplication.shared.open(url)
            }
        }
    }
}
