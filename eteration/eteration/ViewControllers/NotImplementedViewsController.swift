//
//  NotImplementedViewsController.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

class NotImplementedViewsController: UIViewController {
  private var notImplementedLabel: UILabel = {
    var label = UILabel()
    label.text = "This screen is not implemented :)"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(notImplementedLabel)

    NSLayoutConstraint.activate(
      [
        notImplementedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        notImplementedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        notImplementedLabel.heightAnchor.constraint(equalToConstant: 30),
      ])

  }
}
