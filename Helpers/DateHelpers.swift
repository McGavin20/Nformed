//
//  DateHelpers.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import Foundation

func formatUnixDate(_ unixTime: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter.string(from: date)
}

