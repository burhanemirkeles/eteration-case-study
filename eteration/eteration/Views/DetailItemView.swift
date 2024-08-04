//
//  DetailItemView.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit
import Kingfisher

public final class DetailItemView: UIView {
  public struct Item {
    let imageURL: String
    let titleText: String
    let detailText: String
  }

  private let item: DetailItemView.Item

  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleToFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.textColor = .green
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  init(item: DetailItemView.Item) {
    self.item = item
    super.init(frame: .zero)
    setupView()
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    addSubview(imageView)
    addSubview(titleLabel)
    addSubview(descriptionLabel)

    NSLayoutConstraint.activate([
    imageView.topAnchor.constraint(equalTo: topAnchor),
    imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
    imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
    imageView.heightAnchor.constraint(equalToConstant: 225),

    titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

    descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
    descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
    descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
  }

  private func configure() {
    titleLabel.text = item.titleText
    descriptionLabel.text = item.detailText
    imageView.kf.setImage(with: URL(string: item.imageURL))
  }
}

#if DEBUG
extension DetailItemView {
  var testItem: DetailItemView.Item {
    return item
  }
}
#endif
