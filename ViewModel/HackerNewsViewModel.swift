//
//  NewsModel.swift
//  Nformed
//
//  Created by Sharma on 19/09/2024.
//

import Foundation

class HackerNewsViewModel: ObservableObject {
    @Published var newsItems = [HNItem]()
    @Published var jobItems = [HNItem]()
    @Published var askItems = [HNItem]()
    
    func fetchAllItems() {
        fetchNewsItems()
        fetchJobItems()
        fetchAskItems()
    }

    func fetchNewsItems() {
        let url = "https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty"
        fetchItems(from: url) { items in
            DispatchQueue.main.async {
                self.newsItems = items
            }
        }
    }
    
    func fetchJobItems() {
        let url = "https://hacker-news.firebaseio.com/v0/jobstories.json?print=pretty"
        fetchItems(from: url) { items in
            DispatchQueue.main.async {
                self.jobItems = items
            }
        }
    }

    func fetchAskItems() {
        let url = "https://hacker-news.firebaseio.com/v0/askstories.json?print=pretty"
        fetchItems(from: url) { items in
            DispatchQueue.main.async {
                self.askItems = items
            }
        }
    }

    private func fetchItems(from urlString: String, completion: @escaping ([HNItem]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let ids = try JSONDecoder().decode([Int].self, from: data)
                    self.fetchItemDetails(for: ids, completion: completion)
                } catch {
                    print("Error decoding IDs: \(error)")
                }
            }
        }.resume()
    }
    
    private func fetchItemDetails(for ids: [Int], completion: @escaping ([HNItem]) -> Void) {
        var items = [HNItem]()
        let group = DispatchGroup()
        
        for id in ids.prefix(20) {
            group.enter()
            let itemURL = "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty"
            guard let url = URL(string: itemURL) else { continue }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let item = try JSONDecoder().decode(HNItem.self, from: data)
                        items.append(item)
                    } catch {
                        print("Error decoding item: \(error)")
                    }
                }
                group.leave()
            }.resume()
        }
        
        group.notify(queue: .main) {
            completion(items)
        }
    }
}
