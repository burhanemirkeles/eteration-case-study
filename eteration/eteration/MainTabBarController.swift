//
//  ViewController.swift
//  eteration
//
//  Created by Emir Keleş on 2.08.2024.
//

import UIKit

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let homeVC = HomeViewController()
    homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(resource: .homeIcon), tag: 0)

    let badgeValue = CoreDataHelper.shared.fetchCartItems().count
    let secondVC = CartViewController()
    secondVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(resource: .basketIcon), tag: 1)
    secondVC.tabBarItem.badgeValue = String(badgeValue)

    let thirdVC = NotImplementedViewsController()
    thirdVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(resource: .favoriteIcon), tag: 2)

    let fourthVC = NotImplementedViewsController()
    fourthVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(resource: .profileIcon), tag: 3)

    viewControllers = [homeVC, secondVC, thirdVC, fourthVC]
  }

}

