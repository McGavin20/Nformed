//
//  JobItemView.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import SwiftUI

struct JobItemView: View {
    let item: HNItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title ?? "No Job Title")
                .font(.headline)
                .lineLimit(2)
            
            Text("Posted: \(formatUnixDate(item.time ?? 0))")
                .font(.subheadline)
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

