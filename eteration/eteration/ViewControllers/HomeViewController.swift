//
//  HomeViewController.swift
//  eteration
//
//  Created by Emir Keleş on 2.08.2024.
//

import UIKit

class HomeViewController: UIViewController {
  private var viewModel: HomeViewModel

  init() {
    let model = HomeModel(title: nil)
    self.viewModel = HomeViewModel(model: model)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    title = viewModel.title

    let label = UILabel()
    label.text = viewModel.title
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)

    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
