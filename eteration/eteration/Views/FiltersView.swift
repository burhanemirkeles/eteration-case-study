//
//  FiltersView.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

public final class FiltersView: UIView {
  public struct Item {
    let onTapButton: VoidCallback

    init(onTapButton: @escaping VoidCallback) {
      self.onTapButton = onTapButton
    }
  }

  private var item: Item?

  private let filtersLabel: UILabel = {
    let label = UILabel()
    label.text = "Filters:"
    label.font = UIFont.systemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let selectFilterButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Select Filter", for: .normal)
    button.backgroundColor = UIColor.lightGray
    button.setTitleColor(.black, for: .normal)
    button.layer.cornerRadius = 6
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  init(item: FiltersView.Item, frame: CGRect = CGRect()) {
    super.init(frame: frame)
    self.item = item
    setupView()
    configureButton()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureButton() {
    selectFilterButton.addTarget(self, action: #selector(onTapSelectFilterButton), for: .touchUpInside)
  }

  private func setupView() {
    addSubview(filtersLabel)
    addSubview(selectFilterButton)

    NSLayoutConstraint.activate([
      filtersLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      filtersLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

      selectFilterButton.leadingAnchor.constraint(equalTo: filtersLabel.trailingAnchor, constant: 10),
      selectFilterButton.trailingAnchor.constraint(equalTo: trailingAnchor),
      selectFilterButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      selectFilterButton.widthAnchor.constraint(equalToConstant: 158),
      selectFilterButton.heightAnchor.constraint(equalToConstant: 36)
    ])
  }

  @objc private func onTapSelectFilterButton() {
    tapFunc()
  }

  private func tapFunc() {
    item?.onTapButton()
  }
}
