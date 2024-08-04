//
//  CountButtonView.swift
//  eteration
//
//  Created by Emir Keleş on 4.08.2024.
//

import UIKit

public final class CountButtonView: UIView {
  public struct Item {
    let count: Int?
  }

  private let minusButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .lightGray.withAlphaComponent(0.5)
    button.setTitle("-", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.tag = 0
    button.layer.cornerRadius = 6
    return button
  }()

  private let plusButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .lightGray.withAlphaComponent(0.5)
    button.setTitle("+", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.tag = 1
    button.layer.cornerRadius = 6
    return button
  }()

  private let countView: UIView = {
    let view = UIView()
    view.backgroundColor = .buttonBlue
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let label: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  public var count: Int = 0 {
    didSet {
      if count > 0 {
        label.text = "\(count)"
      } else {
        count = 0
        label.text = "0"
      }
    }
  }
  
  init(item: CountButtonView.Item) {
    super.init(frame: .zero)
    self.count = item.count.orZero
    label.text = "\(count)"
    setupView()
    minusButton.addTarget(self, action: #selector(counter), for: .touchUpInside)
    plusButton.addTarget(self, action: #selector(counter), for: .touchUpInside)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    addSubview(minusButton)
    addSubview(plusButton)
    addSubview(countView)
    countView.addSubview(label)

    NSLayoutConstraint.activate([
      minusButton.leadingAnchor.constraint(equalTo: leadingAnchor),
      minusButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      minusButton.heightAnchor.constraint(equalToConstant: 40),
      minusButton.widthAnchor.constraint(equalToConstant: 50),

      countView.centerYAnchor.constraint(equalTo: centerYAnchor),
      countView.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
      countView.heightAnchor.constraint(equalToConstant: 42),
      countView.widthAnchor.constraint(equalToConstant: 56),

      label.centerXAnchor.constraint(equalTo: countView.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: countView.centerYAnchor),

      plusButton.leadingAnchor.constraint(equalTo: countView.trailingAnchor),
      plusButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      plusButton.heightAnchor.constraint(equalToConstant: 40),
      plusButton.widthAnchor.constraint(equalToConstant: 50),
    ])
  }


  @objc func counter(_ sender: UIButton) {
    if sender.tag == 0 {
      count -= 1
    }
    if sender.tag == 1 {
      count += 1
    }
  }


}
