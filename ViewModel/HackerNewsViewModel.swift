//
//  NewsModel.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import Foundation

class HackerNewsViewModel: ObservableObject {
    @Published var stories = [HNItem]()
    @Published var jobs = [HNItem]()
    @Published var asks = [HNItem]()

    private let baseURL = "https://hacker-news.firebaseio.com/v0/"
    
    // Fetching specific types of items (new, job, ask)
    func fetchItems(for type: String) {
        let urlString = "\(baseURL)\(type)stories.json?print=pretty"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let ids = try JSONDecoder().decode([Int].self, from: data)
                    self.fetchDetails(for: ids, type: type)
                } catch {
                    print("Error decoding IDs: \(error)")
                }
            }
        }.resume()
    }

    // Fetch item details
    func fetchDetails(for ids: [Int], type: String) {
        for id in ids.prefix(20) {
            let itemURL = "\(baseURL)item/\(id).json?print=pretty"
            guard let url = URL(string: itemURL) else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let item = try JSONDecoder().decode(HNItem.self, from: data)
                        DispatchQueue.main.async {
                            switch type {
                            case "new":
                                if !self.stories.contains(where: { $0.id == item.id }) {
                                    self.stories.append(item)
                                }
                            case "job":
                                if !self.jobs.contains(where: { $0.id == item.id }) {
                                    self.jobs.append(item)
                                }
                            case "ask":
                                if !self.asks.contains(where: { $0.id == item.id }) {
                                    self.asks.append(item)
                                }
                            default:
                                break
                            }
                        }
                    } catch {
                        print("Error decoding item: \(error)")
                    }
                }
            }.resume()
        }
    }
}

