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

  func deleteData(shopItem: ShopItem?) {
    let  appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let coord = context.persistentStoreCoordinator

    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")

    let predicate = NSPredicate(format: "id == %@", (shopItem?.id).orEmpty)
    fetchRequest.predicate = predicate

    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    do {
      try coord?.execute(deleteRequest, with: context)
    } catch  {
      print(error.localizedDescription)
    }
  }

  func fetchCartItems() -> [AddedCartItem] {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
    request.returnsObjectsAsFaults = false
    var cartItems: [AddedCartItem] = []
    var itemCounts: [String: Int] = [:]

    do {
      let results = try context.fetch(request)
      if results.count > 0 {
        for result in results as! [NSManagedObject] {
          if let id = result.value(forKey: CartItemAttributes.id) as? String {
            if itemCounts[id] != nil {
              itemCounts[id]! += 1
            } else {
              itemCounts[id] = 1
            }
          }
        }

        for (id, count) in itemCounts {
          if let result = results.first(where: { ($0 as! NSManagedObject).value(forKey: CartItemAttributes.id) as? String == id }) as? NSManagedObject {
            cartItems.append(
              AddedCartItem(
                item: ShopItem(
                  createdAt: result.value(forKey: CartItemAttributes.createdAt) as? String,
                  name: result.value(forKey: CartItemAttributes.name) as? String,
                  imageUrl: result.value(forKey: CartItemAttributes.imageUrl) as? String,
                  price: result.value(forKey: CartItemAttributes.price) as? String,
                  description: result.value(forKey: CartItemAttributes.detail) as? String,
                  model: result.value(forKey: CartItemAttributes.model) as? String,
                  brand: result.value(forKey: CartItemAttributes.brand) as? String,
                  id: result.value(forKey: CartItemAttributes.id) as? String
                ),
                count: count
              )
            )
          }
        }
      }
    } catch {
            print(error.localizedDescription)
        }

    return cartItems
  }
}

