//
//  TransactionDetailsPresenterTests.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 23/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
@testable import BudTransactions

class TransactionDetailsPresenterTests: XCTestCase {

  let presenter = TransactionDetailsPresenter()
  let view = TransactionDetailsMockView()

  override func setUp() {
    presenter.view = view
  }

  func testPresenterConversionLogic() {
    let mockModelOne = MockTransactionDomainModel.transactionOne
    let mockModelSix = MockTransactionDomainModel.transactionSix

    presenter.fetched(mockModelOne)

    XCTAssertNotNil(view.representable)
    XCTAssertEqual(view.representable?.amount, "£10.00")
    XCTAssertEqual(view.representable?.categoryColour, BudColour.navyBlue.rawValue)
    XCTAssertEqual(view.representable?.categoryDescription, "Entertainment")
    XCTAssertEqual(view.representable?.categoryIconName, "ic_entertainment")
    XCTAssertEqual(view.representable?.dateString, "Wednesday, 1 Aug")
    XCTAssertEqual(view.representable?.description, "test description one")
    XCTAssertEqual(view.representable?.productName, "Product 1")
    XCTAssertEqual(view.representable?.productURLString, "www.test.com")

    presenter.fetched(mockModelSix)
    XCTAssertNotNil(view.representable)
    XCTAssertEqual(view.representable?.amount, "£90.00")
    XCTAssertEqual(view.representable?.categoryColour, BudColour.green.rawValue)
    XCTAssertEqual(view.representable?.categoryDescription, "Groceries")
    XCTAssertEqual(view.representable?.categoryIconName, "ic_groceries")
    XCTAssertEqual(view.representable?.dateString, "Tuesday, 7 Aug")
    XCTAssertEqual(view.representable?.description, "test description six")
    XCTAssertEqual(view.representable?.productName, "Product 2")
    XCTAssertEqual(view.representable?.productURLString, "www.test.com")

  }
}
