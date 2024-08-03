//
//  HomeViewModel.swift
//  eteration
//
//  Created by Emir Keleş on 2.08.2024.
//

import Foundation

class HomeViewModel {
  private let model: HomeModel
  private var allItems: [ShopItem] = []
  var filteredItems: [ShopItem] = []
  var reloadCollectionView: (() -> Void)?

  init(model: HomeModel) {
    self.model = model
  }

  func fetchItems() {
    guard let url = URL(string: "https://5fc9346b2af77700165ae514.mockapi.io/products") else { return }

    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      if let error = error {
        print("Error fetching data: \(error)")
        return
      }

      guard let data = data else {
        print("No data found")
        return
      }

      do {
        let items = try JSONDecoder().decode([ShopItem].self, from: data)
        self?.allItems = items
        self?.filteredItems = items
        self?.reloadCollectionView?()
      } catch {
        print("Error decoding data: \(error)")
      }
    }

    task.resume()
  }

  func filterItems(with query: String) {
    if query.isEmpty {
      filteredItems = allItems
    } else {
      filteredItems = allItems.filter { ($0.name?.lowercased()).orEmpty.contains(query.lowercased()) }
    }
    reloadCollectionView?()
  }
}
