//
//  ShopItem.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import Foundation

public struct ShopItem: Codable {
  let createdAt, name: String?
  let imageUrl: String?
  let price, description, model, brand: String?
  let id: String?

  enum CodingKeys: String, CodingKey {
    case createdAt
    case name
    case imageUrl = "image"
    case price
    case description
    case model
    case brand
    case id
  }
}
