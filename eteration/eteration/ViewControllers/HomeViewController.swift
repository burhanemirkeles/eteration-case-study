//
//  HomeViewController.swift
//  eteration
//
//  Created by Emir Keleş on 2.08.2024.
//

import UIKit

class HomeViewController: UIViewController {
  internal var viewModel: HomeViewModel

  // MARK: - Subviews
  private let customSearchBar: SearchBar = {
    let searchBar = SearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    return searchBar
  }()

  private var filtersView: FiltersView!

  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()

  private let loadingIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(style: .large)
    indicator.color = .gray
    indicator.translatesAutoresizingMaskIntoConstraints = false
    return indicator
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
    customSearchBar.getSearchBar().delegate = self
    setupSearchBar()
    setupFiltersView()
    setupCollectionView()
    setupLoadingIndicator()
    setupBindings()
    viewModel.fetchCartItems()
    viewModel.fetchItems()
  }

  // MARK: - Configure Subviews
  private func setupSearchBar() {
    view.addSubview(customSearchBar)

    NSLayoutConstraint.activate([
      customSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      customSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      customSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      customSearchBar.heightAnchor.constraint(equalToConstant: 40)
    ])
  }

  private func setupFiltersView() {
    let filtersViewItem = FiltersView.Item(
      onTapButton: { [weak self] in
        self?.presentFilterViewController()
      }
    )
    filtersView = FiltersView(item: filtersViewItem)
    filtersView.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(filtersView)

    NSLayoutConstraint.activate([
      filtersView.topAnchor.constraint(equalTo: customSearchBar.bottomAnchor, constant: 20),
      filtersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      filtersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      filtersView.heightAnchor.constraint(equalToConstant: 36)
    ])
  }

  private func setupCollectionView() {
    view.addSubview(collectionView)

    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(ShopItemCollectionViewCell.self, forCellWithReuseIdentifier: "ShopItemCollectionViewCell")

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: filtersView.bottomAnchor, constant: 10),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }

  private func setupLoadingIndicator() {
    view.addSubview(loadingIndicator)

    NSLayoutConstraint.activate([
      loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

  private func presentFilterViewController() {
    let filterViewController = FilterViewController()
    filterViewController.modalPresentationStyle = .pageSheet
    if let sheet = filterViewController.sheetPresentationController {
      sheet.prefersGrabberVisible = true
      sheet.presentingViewController.title = "Filter"
    }
    present(filterViewController, animated: true, completion: nil)
  }

  internal func presentDetailViewController(for item: ShopItem) {
    let viewModel = DetailViewModel(item: item)
    let detailViewController = DetailViewController(viewModel: viewModel)
    detailViewController.hidesBottomBarWhenPushed = false
    navigationController?.pushViewController(detailViewController, animated: true)
  }

  private func setupBindings() {
    viewModel.reloadCollectionView = { [weak self] in
      DispatchQueue.main.async {
        self?.loadingIndicator.stopAnimating()
        self?.collectionView.reloadData()
      }
    }
    loadingIndicator.startAnimating()
  }
}
