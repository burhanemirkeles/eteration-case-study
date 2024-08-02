//
//  HomeViewController.swift
//  eteration
//
//  Created by Emir Keleş on 2.08.2024.
//

import UIKit

class HomeViewController: UIViewController {
  private var viewModel: HomeViewModel

  // MARK: - Subviews
  private let customSearchBar: SearchBar = {
    let searchBar = SearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    return searchBar
  }()

  private let filtersView: FiltersView = {
    let view = FiltersView(
      item: FiltersView.Item(
        onTapButton: {
          // TODO: Add On Tap Action
        }
      )
    )
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  init() {
    let model = HomeModel(title: "Home Page")
    self.viewModel = HomeViewModel(model: model)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupSearchBar()
    setupFiltersView()
  }

  // MARK: - Configure Subviews
  private func setupSearchBar() {
    view.addSubview(customSearchBar)

    NSLayoutConstraint.activate([
      customSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
      customSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      customSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      customSearchBar.heightAnchor.constraint(equalToConstant: 40)
    ])
  }

  private func setupFiltersView() {
    view.addSubview(filtersView)

    NSLayoutConstraint.activate([
      filtersView.topAnchor.constraint(equalTo: customSearchBar.bottomAnchor, constant: 20),
      filtersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      filtersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      filtersView.heightAnchor.constraint(equalToConstant: 36)
    ])
  }
}
