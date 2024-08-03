//
//  HomeViewModel.swift
//  eteration
//
//  Created by Emir Keleş on 2.08.2024.
//

import Foundation

class HomeViewModel {
  private let model: HomeModel
  private let apiService = APIService()
  private(set) var items: [ShopItem] = [] {
    didSet {
      reloadCollectionView?()
    }
  }
  var reloadCollectionView: (() -> Void)?

  init(model: HomeModel) {
    self.model = model
  }

  var title: String {
    return model.title.orEmpty
  }

  func fetchItems() {
    apiService.fetchShopItems { [weak self] result in
      switch result {
      case .success(let items):
        self?.items = items
      case .failure(let error):
        print("Failed to fetch items: \(error)")
      }
    }
  }
}
