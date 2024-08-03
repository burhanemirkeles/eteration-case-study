//
//  ShopItemCollectionViewCell.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit
import Kingfisher

class ShopItemCollectionViewCell: UICollectionViewCell {

  public struct Item {
    let priceText: String
    let nameText: String
    let isFavorited: Bool
    let imageUrl: String
  }

  private let itemImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    label.textColor = UIColor(named: "buttonBlue")
    label.textAlignment = .left
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    label.textAlignment = .left
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let actionButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Add to Cart", for: .normal)
    button.backgroundColor = UIColor(named: "buttonBlue")
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 5
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  private let favoriteButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(resource: .favoriteButton), for: .normal)
    button.setImage(UIImage(resource: .favoriteButton).withTintColor(UIColor(resource: .favoriteSelectedYellow)), for: .selected)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    contentView.addSubview(itemImageView)
    contentView.addSubview(favoriteButton)
    contentView.addSubview(priceLabel)
    contentView.addSubview(nameLabel)
    contentView.addSubview(actionButton)

    NSLayoutConstraint.activate([
      itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      itemImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      itemImageView.widthAnchor.constraint(equalToConstant: 150),
      itemImageView.heightAnchor.constraint(equalToConstant: 150),

      favoriteButton.trailingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: -6),
      favoriteButton.topAnchor.constraint(equalTo: itemImageView.topAnchor, constant: 6),
      favoriteButton.widthAnchor.constraint(equalToConstant: 24),
      favoriteButton.heightAnchor.constraint(equalToConstant: 24),


      priceLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 8),
      priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
      priceLabel.heightAnchor.constraint(equalToConstant: 17),

      nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      nameLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 34),

      actionButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
      actionButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      actionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      actionButton.heightAnchor.constraint(equalToConstant: 36)
    ])

    favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)

  }

  func configure(with item: ShopItemCollectionViewCell.Item) {
    itemImageView.kf.setImage(with: URL(string: item.imageUrl))
    priceLabel.text = item.priceText
    nameLabel.text = item.nameText
    favoriteButton.isSelected = item.isFavorited
  }

  @objc func favoriteButtonTapped() {
    favoriteButton.isSelected.toggle()
  }
}
