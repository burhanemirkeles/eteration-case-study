//
//  HomeViewController+UISearchbar.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

extension HomeViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    viewModel.filterItems(with: searchText)
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = ""
    viewModel.filterItems(with: "")
  }
}
