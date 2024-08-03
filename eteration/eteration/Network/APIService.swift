//
//  APIService.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import Foundation

enum APIServiceError: Error {
  case invalidURL
  case requestFailed
  case decodingError
}

class APIService {
  private let baseURL = "https://5fc9346b2af77700165ae514.mockapi.io/products"

  func fetchShopItems(completion: @escaping (Result<[ShopItem], APIServiceError>) -> Void) {
    guard let url = URL(string: baseURL) else {
      completion(.failure(.invalidURL))
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let _ = error {
        completion(.failure(.requestFailed))
        return
      }

      guard let data = data else {
        completion(.failure(.requestFailed))
        return
      }

      do {
        let items = try JSONDecoder().decode([ShopItem].self, from: data)
        completion(.success(items))
      } catch {
        completion(.failure(.decodingError))
      }
    }
    task.resume()
  }
}

