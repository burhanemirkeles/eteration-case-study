//
//  DetailBottomView.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

class DetailBottomView: UIView {

  struct Item {
    let headerText: String?
    let price: String
    let buttonTitle: String?
  }

  var priceText: String?
  var actionButtonTappedVoidCallback: VoidCallback?

  private let priceTitleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.textColor = .buttonBlue
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let actionButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .buttonBlue
    button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    button.layer.cornerRadius = 8
    button.clipsToBounds = true
    return button
  }()

  init(item: Item) {
    super.init(frame: .zero)
    setupViews()
    priceText = item.price
    priceLabel.text = priceText
    priceTitleLabel.text = item.headerText
    actionButton.setTitle(item.buttonTitle, for: .normal)
    actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
  }

  @objc func actionButtonTapped() {
    actionButtonTappedVoidCallback?()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    addSubview(priceTitleLabel)
    addSubview(priceLabel)
    addSubview(actionButton)

    NSLayoutConstraint.activate([
      priceTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      priceTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

      priceLabel.topAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor, constant: 4),
      priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

      actionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      actionButton.widthAnchor.constraint(equalToConstant: 182),
      actionButton.heightAnchor.constraint(equalToConstant: 38)
    ])
  }
}
