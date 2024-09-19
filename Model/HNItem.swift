//
//  HNItem.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import Foundation

struct HNItem: Identifiable, Codable {
    let id: Int
    let title: String?
    let by: String?
    let url: String?
    let score: Int?
    let time: Int?
    let type: String?
    let descendants: Int?
}

