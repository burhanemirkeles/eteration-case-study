//
//  DetailViewController.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

class DetailViewController: UIViewController {

  private var viewModel: DetailViewModel

  private let detailItemView: DetailItemView

  private let detailBottomView: DetailBottomView

  init(viewModel: DetailViewModel) {
    self.viewModel = viewModel
    self.detailBottomView = DetailBottomView(item: DetailBottomView.Item(price: viewModel.price))
    self.detailItemView = DetailItemView(
      item: DetailItemView.Item(
        imageURL: viewModel.image,
        titleText: viewModel.title,
        detailText: viewModel.description
      )
    )
    self.detailItemView.translatesAutoresizingMaskIntoConstraints = false
    self.detailBottomView.translatesAutoresizingMaskIntoConstraints = false
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
  }

  private func setupViews() {
    view.addSubview(detailItemView)
    view.addSubview(detailBottomView)

    NSLayoutConstraint.activate([
      detailItemView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      detailItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      detailItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      detailItemView.heightAnchor.constraint(equalToConstant: 200),

      detailBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      detailBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      detailBottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      detailBottomView.heightAnchor.constraint(equalToConstant: 80)
    ])
  }
}
#if DEBUG
extension DetailViewController {
  var testDetailItemView: DetailItemView {
    return detailItemView
  }

  var testDetailBottomView: DetailBottomView {
    return detailBottomView
  }
}
#endif
