//
//  HomeViewController+UICollectionView.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.filteredItems.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopItemCollectionViewCell", for: indexPath) as? ShopItemCollectionViewCell else {
      return UICollectionViewCell()
    }

    let item = viewModel.filteredItems[indexPath.row]
    cell.configure(
      with: ShopItem(
        createdAt: item.createdAt,
        name: item.name,
        imageUrl: item.imageUrl,
        price: item.price,
        description: item.description,
        model: item.model,
        brand: item.brand, id: item.id
      )
    )

    cell.reloadCallback = {
      if let tabBarController = self.tabBarController as? MainTabBarController {
        let cartTabIndex = 1
        if let cartVC = tabBarController.viewControllers?[cartTabIndex] as? CartViewController {
          cartVC.tabBarItem.badgeValue = "\(CoreDataHelper.shared.fetchCartItems().count)"
        }
      }
    }

    cell.favoriteCallback = {
      let alert = UIAlertController(
        title: "This feature is not implemented",
        message: "It can be implemented same as adding cart feature. Create a new entity for favorited items in CoreData. Funcs in CoreDataHelper can be refactored for these two entities.",
        preferredStyle: .alert
      )
      alert.addAction(UIAlertAction(title: "Ok!", style: .default))
      self.present(alert, animated: true, completion: nil)
    }

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let item = viewModel.filteredItems[indexPath.row]
    presentDetailViewController(for: item)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 170, height: 302)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
  }
}
