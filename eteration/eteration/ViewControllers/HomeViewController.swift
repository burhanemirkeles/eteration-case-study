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

  private var filtersView: FiltersView!

  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
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
    setupCollectionView()
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

  private func presentFilterViewController() {
    let filterViewController = FilterViewController()
    filterViewController.modalPresentationStyle = .pageSheet
    present(filterViewController, animated: true, completion: nil)
  }

  private func presentDetailViewController(for item: ShopItem) {
    let viewModel = DetailViewModel(item: item)
    let detailViewController = DetailViewController(viewModel: viewModel)
    //    detailViewController.hidesBottomBarWhenPushed = false
    navigationController?.pushViewController(detailViewController, animated: true)
  }

}
// MARK: CollectionView Delegate & Layout
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopItemCollectionViewCell", for: indexPath) as? ShopItemCollectionViewCell else {
      return UICollectionViewCell()
    }

    let item = ShopItem(createdAt: "2023-07-17T07:21:02.529Z", name: "iPhone 13 Pro Max 256Gb", imageUrl: "https://loremflickr.com/640/480/food", price: "15.000 ₺", description: "zort", model: "iPhone 13", brand: "Apple", id: "1")
    cell.configure(with: ShopItemCollectionViewCell.Item(priceText: item.price.orEmpty, nameText: item.name.orEmpty, isFavorited: false, imageUrl: item.imageUrl.orEmpty))

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let item = ShopItem(createdAt: "123", name: "Apple iPhone 14 Pro Max 256 GB", imageUrl: "https://loremflickr.com/640/480/food", price: "123421 ₺", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sodales nibh pretium ipsum faucibus, a commodo tortor blandit. Duis pellentesque, purus sed gravida sagittis, tortor urna eleifend ante, a volutpat ex est vel ipsum. Etiam in auctor nisi. Donec in mattis enim, in bibendum lorem. Nam vitae semper quam.", model: "14 Pro Max", brand: "Apple", id: "1")
    
    presentDetailViewController(for: item)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 170, height: 302)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
  }
}
