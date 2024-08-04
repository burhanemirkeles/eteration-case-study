//
//  DetailViewModel.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import Foundation

class DetailViewModel {
  public let item: ShopItem

  init(item: ShopItem) {
    self.item = item
  }

  var image: String {
    return item.imageUrl.orEmpty
  }

  var title: String {
    return item.name.orEmpty
  }

  var description: String {
    return item.description.orEmpty
  }

  var price: String {
    return item.price.orEmpty
  }
}

#if DEBUG
extension DetailViewModel {
  var testItem: ShopItem {
    return item
  }
}
#endif
