//
//  BudTransactionsUITests.swift
//  BudTransactionsUITests
//
//  Created by Alessandro Manni on 18/09/2019.
//  Copyright © 2019 Alessandro Manni. All rights reserved.
//

import XCTest
@testable import BudTransactions

class MainJourneyUITests: XCTestCase {
  let waitTime: UInt32 = 2
  let app = XCUIApplication()

  var rootView: XCUIElement {
    return app.otherElements["transactionsListRootView"]
  }

  var transactionsTableView: XCUIElement {
    return self.app.tables["transactionsListTableView"]
  }

  var detailsRootView: XCUIElement {
    return app.otherElements["transactionDetailsRootView"]
  }

  var transactionDetailsBottomView: XCUIElement {
    return app.otherElements["transactionDetailsBottomView"]
  }

  var transactionDetailsTopView: XCUIElement {
    return app.otherElements["transactionDetailsTopView"]
  }

  override func setUp() {
    super.setUp()
    XCUIApplication().launch()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testCompetitionListRootViewElements() {
    sleep(waitTime)
    XCTAssertTrue(rootView.exists, "Rootview has not been displayed")
    XCTAssertTrue(transactionsTableView.exists, "TableView has not been displayed")
  }

  func testTableView() {
    let numberOfScrolls = 3
    XCTAssertTrue(transactionsTableView.cells.count > 0, "transactionsTableView should not be empty!")

    guard transactionsTableView.swipe(.up, times: numberOfScrolls) else {
      XCTFail("The table view  can not be scrolled up")
      return
    }
    guard transactionsTableView.swipe(.down, times: numberOfScrolls) else {
      XCTFail("The table view  can not be scrolled down")
      return
    }
  }

  func testLoadDetailsView() {
    transactionsTableView.cells.allElementsBoundByIndex.first?.tap()
    XCTAssertTrue(detailsRootView.exists, "Details main view has not been displayed")
    XCTAssertTrue(transactionDetailsBottomView.exists, "Details bottom view has not been displayed")
    XCTAssertTrue(transactionDetailsTopView.exists, "Details top view has not been displayed")
  }
}

extension XCUIElement {

  enum Direction {
    case up
    case down
    case left
    case right
  }

  @discardableResult
  func swipe(_ direction: Direction, times: Int) -> Bool {
    guard times > 0 else {
      return false
    }

    for _ in 1...times {
      switch direction {
      case .up:
        self.swipeUp()
      case .down:
        self.swipeDown()
      case .left:
        self.swipeLeft()
      case .right:
        self.swipeRight()
      }
    }
    return true
  }
}
