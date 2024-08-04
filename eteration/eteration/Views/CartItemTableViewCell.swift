//
//  CartItemTableViewCell.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {
  public var item: AddedCartItem?
  public var deleteCallback: VoidCallback?
  public var addCallback: VoidCallback?
  // MARK: - Subviews
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    return label
  }()

  private let detailLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    return label
  }()

  private var countButtonView: CountButtonView

  // MARK: - Initializer
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    self.countButtonView = CountButtonView(item: CountButtonView.Item(count: item?.count))
    self.countButtonView.translatesAutoresizingMaskIntoConstraints = false
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupSubviews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Setup Methods
  private func setupSubviews() {
    contentView.addSubview(titleLabel)
    contentView.addSubview(detailLabel)
    contentView.addSubview(countButtonView)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: countButtonView.leadingAnchor, constant: -16),
      titleLabel.widthAnchor.constraint(equalToConstant: 150),

      detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

      countButtonView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 15),
      countButtonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      countButtonView.topAnchor.constraint(equalTo: contentView.topAnchor),
      countButtonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    ])
  }

  // MARK: - Configuration Method
  func configure(with item: ShopItem, quantity: Int) {
    self.item?.count = quantity
    titleLabel.text = item.name
    detailLabel.text = item.price
    countButtonView.count = quantity
    countButtonView.deleteCallback = { [weak self] in
      self?.deleteCallback?()
    }
    countButtonView.addCallback = { [weak self] in
      self?.addCallback?()
    }
  }
}
