//
//  NewsItemView.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import SwiftUI

struct NewsItemView: View {
    let item: HNItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title ?? "No Title")
                .font(.custom("Newsreader-VariableFont_opsz,wght", size: 18))
                .fontWeight(.bold)
                .foregroundStyle(.orange)
                .lineLimit(2)

            HStack {
                Text("Posted: \(formatUnixDate(item.time ?? 0))")
                    .font(.custom("Newsreader-Italic-VariableFont_opsz,wght", size: 12))
                    .foregroundColor(.gray)
                Spacer()
                Text("Author: \(item.by ?? "Unknown")")
                    .font(.custom("Newsreader-Italic-VariableFont_opsz,wght", size: 12))
                    .foregroundColor(.gray)
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
