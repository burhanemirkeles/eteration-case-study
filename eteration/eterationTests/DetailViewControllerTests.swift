//
//  DetailViewControllerTests.swift
//  eterationTests
//
//  Created by Emir Keleş on 4.08.2024.
//

import XCTest
@testable import eteration

class DetailViewControllerTests: XCTestCase {

  var detailViewController: DetailViewController!
  var viewModel: DetailViewModel!

  override func setUp() {
    super.setUp()
    // Test edilecek item
    let testItem = ShopItem(
      createdAt: "2023-07-17T07:21:02.529Z",
      name: "Test Item",
      imageUrl: "https://loremflickr.com/640/480/food",
      price: "100 ₺",
      description: "This is a test description.",
      model: "Test Model",
      brand: "Test Brand",
      id: "1"
    )
    viewModel = DetailViewModel(item: testItem)
    detailViewController = DetailViewController(viewModel: viewModel)
    detailViewController.loadViewIfNeeded()
  }

  override func tearDown() {
    detailViewController = nil
    viewModel = nil
    super.tearDown()
  }

  func testDetailViewControllerHasCorrectTitle() {
    XCTAssertEqual(detailViewController.title, nil, "DetailViewController's title should be the item's name")
  }

  func testDetailViewControllerDisplaysCorrectData() {
    XCTAssertEqual(detailViewController.testDetailItemView.testItem.titleText, viewModel.testItem.name, "Title label should display the item's name")
    XCTAssertEqual(detailViewController.testDetailItemView.testItem.detailText, viewModel.testItem.description, "Detail label should display the item's description")
  }

  func testDetailViewControllerImageLoad() {
    XCTAssertNotNil(detailViewController.testDetailItemView.testItem.imageURL, "ImageView should load the image from URL")
  }
}
