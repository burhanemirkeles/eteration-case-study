//
//  SearchBar.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

public final class SearchBar: UIView {
  private let searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "Search"
    searchBar.searchBarStyle = .minimal
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    return searchBar
  }()

  override public init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    addSubview(searchBar)

    NSLayoutConstraint.activate([
      searchBar.topAnchor.constraint(equalTo: topAnchor),
      searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
      searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
      searchBar.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

  func getSearchBar() -> UISearchBar {
    searchBar
  }
}
