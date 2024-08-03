//
//  DetailBottomView.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

class DetailBottomView: UIView {

  struct Item {
    let price: String
  }

  private let priceTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Price"
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let actionButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Add to Cart", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 8
    button.clipsToBounds = true
    return button
  }()

  init(item: Item) {
    super.init(frame: .zero)
    setupViews()
    priceLabel.text = item.price
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
      actionButton.widthAnchor.constraint(equalToConstant: 100),
      actionButton.heightAnchor.constraint(equalToConstant: 44)
    ])
  }
}
