//
//  CoreDataHelper.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import CoreData
import UIKit

public class CoreDataHelper {
  static let shared = CoreDataHelper()

  public func saveData(shopItem: ShopItem?) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let itemToAddCart = NSEntityDescription.insertNewObject(forEntityName: "CartItem", into: context)
    
    guard let shopItem else { return }
    itemToAddCart.setValue(shopItem.id, forKey: CartItemAttributes.id)
    itemToAddCart.setValue(shopItem.brand, forKey: CartItemAttributes.brand)
    itemToAddCart.setValue(shopItem.createdAt, forKey: CartItemAttributes.createdAt)
    itemToAddCart.setValue(shopItem.description, forKey: CartItemAttributes.detail)
    itemToAddCart.setValue(shopItem.imageUrl, forKey: CartItemAttributes.imageUrl)
    itemToAddCart.setValue(shopItem.model, forKey: CartItemAttributes.model)
    itemToAddCart.setValue(shopItem.name, forKey: CartItemAttributes.name)
    itemToAddCart.setValue(shopItem.price, forKey: CartItemAttributes.price)

    do {
      try context.save()
    } catch {
      print("Error on adding cart")
    }
  }

  func fetchCartItems() -> [ShopItem] {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
    request.returnsObjectsAsFaults = false
    var cartItems: [ShopItem] = []

    do {
      let results = try context.fetch(request)
      if results.count > 0 {
        for result in results as! [NSManagedObject] {
          cartItems.append(
            ShopItem(
              createdAt: result.value(forKey: CartItemAttributes.createdAt) as? String,
              name: result.value(forKey: CartItemAttributes.name) as? String,
              imageUrl: result.value(forKey: CartItemAttributes.imageUrl) as? String,
              price: result.value(forKey: CartItemAttributes.price) as? String,
              description: result.value(forKey: CartItemAttributes.detail) as? String,
              model: result.value(forKey: CartItemAttributes.model) as? String,
              brand: result.value(forKey: CartItemAttributes.brand) as? String,
              id: result.value(forKey: CartItemAttributes.id) as? String
            )
          )
        }
      }
    } catch  {
      print(error.localizedDescription)
    }

    return cartItems
  }
}

