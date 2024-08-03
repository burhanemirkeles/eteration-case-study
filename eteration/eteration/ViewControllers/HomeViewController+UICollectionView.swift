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
    cell.configure(with: ShopItemCollectionViewCell.Item(priceText: item.price.orEmpty, nameText: item.name.orEmpty, isFavorited: false, imageUrl: item.imageUrl.orEmpty))

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
