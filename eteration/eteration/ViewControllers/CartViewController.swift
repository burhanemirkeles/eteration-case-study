//
//  CartViewController.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

class CartViewController: UIViewController {
  private var viewModel: CartViewModel?
  private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(CartItemTableViewCell.self, forCellReuseIdentifier: "CartItemTableViewCell")
    return tableView
  }()

  init() {
    super.init(nibName: nil, bundle: nil)
    self.viewModel = CartViewModel()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    viewModel?.fetchItems()
    setupTableView()
  }

  override func viewWillAppear(_ animated: Bool) {
    viewModel?.fetchItems()
    tableView.reloadData()
  }

  private func setupTableView() {
    view.addSubview(tableView)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorStyle = .none
    tableView.allowsSelection = false

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.items.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as? CartItemTableViewCell else {
      return UITableViewCell()
    }
    if let addedCartItem = viewModel?.items[indexPath.row] {
      cell.configure(
        with: ShopItem(
          createdAt: addedCartItem.item.createdAt,
          name: addedCartItem.item.name,
          imageUrl: addedCartItem.item.imageUrl,
          price: addedCartItem.item.price,
          description: addedCartItem.item.description,
          model: addedCartItem.item.model,
          brand: addedCartItem.item.brand,
          id: addedCartItem.item.id
        ),
        quantity: addedCartItem.count
      )
    }
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}
