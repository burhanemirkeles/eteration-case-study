//
//  CartViewModel.swift
//  eteration
//
//  Created by Emir Keleş on 4.08.2024.
//

import Foundation

class CartViewModel {
  var items: [AddedCartItem] = []

  public func fetchItems() {
    items = CoreDataHelper.shared.fetchCartItems()
  }

}
