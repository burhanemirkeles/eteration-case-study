//
//  BaseViewController.swift
//  eteration
//
//  Created by Emir Keleş on 4.08.2024.
//

import UIKit

public protocol BadgeViewUpdatable {
  func updateBadgeView(badgeValue: String)
}

public class BaseViewController: UIViewController, BadgeViewUpdatable {
  public func updateBadgeView(badgeValue: String) {
    if let tabBarController = self.tabBarController as? MainTabBarController {
      let cartTabIndex = 1
      if let cartVC = tabBarController.viewControllers?[cartTabIndex] as? CartViewController {
        cartVC.tabBarItem.badgeValue = "\(badgeValue)"
      }
    }
  }
}
