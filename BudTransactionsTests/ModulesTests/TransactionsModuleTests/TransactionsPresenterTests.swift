//
//  TransactionsPresenterTests.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
@testable import BudTransactions

class TransactionsPresenterTests: XCTestCase {

  let presenter = TransactionsPresenter()
  let view = TransactionsMockView()

  override func setUp() {
    presenter.view = view
  }

  func testPresenterConversionLogic() {

    let mockModels = [MockTransactionDomainModel.transactionOne,
                      MockTransactionDomainModel.transactionSix,
                      MockTransactionDomainModel.transactionThree,
                      MockTransactionDomainModel.transactionTwo,
                      MockTransactionDomainModel.transactionFour,
                      MockTransactionDomainModel.transactionFive]

    presenter.fetched(result: .success((mockModels, nil)))

    XCTAssertEqual(view.representable?.count, 4)
    XCTAssertEqual(view.representable?[0].transactions.count, 1)
    XCTAssertEqual(view.representable?[1].transactions.count, 2)
    XCTAssertEqual(view.representable?[2].transactions.count, 1)
    XCTAssertEqual(view.representable?[3].transactions.count, 2)

    XCTAssertEqual(view.representable?[0].title, "Tuesday, 7 Aug")
    XCTAssertEqual(view.representable?[0].transactions[0].id, "testId6")
    XCTAssertEqual(view.representable?[0].transactions[0].title, "test description six")
    XCTAssertEqual(view.representable?[0].transactions[0].amount, "£90.00")
    XCTAssertEqual(view.representable?[0].transactions[0].iconName, "ic_groceries")

    XCTAssertEqual(view.representable?[1].title, "Sunday, 5 Aug")
    XCTAssertEqual(view.representable?[1].transactions[0].id, "testId4")
    XCTAssertEqual(view.representable?[1].transactions[0].title, "test description four")
    XCTAssertEqual(view.representable?[1].transactions[0].amount, "£120.00")
    XCTAssertEqual(view.representable?[1].transactions[0].iconName, "ic_utilities")

    XCTAssertEqual(view.representable?[1].transactions[1].id, "testId5")
    XCTAssertEqual(view.representable?[1].transactions[1].title, "test description five")
    XCTAssertEqual(view.representable?[1].transactions[1].amount, "£60.00")
    XCTAssertEqual(view.representable?[1].transactions[1].iconName, "ic_take-away")

    XCTAssertEqual(view.representable?[2].title, "Thursday, 2 Aug")
    XCTAssertEqual(view.representable?[2].transactions[0].id, "testId3")
    XCTAssertEqual(view.representable?[2].transactions[0].title, "test description three")
    XCTAssertEqual(view.representable?[2].transactions[0].amount, "£87.00")
    XCTAssertEqual(view.representable?[2].transactions[0].iconName, "ic_utilities")

    XCTAssertEqual(view.representable?[3].title, "Wednesday, 1 Aug")
    XCTAssertEqual(view.representable?[3].transactions[0].id, "testId1")
    XCTAssertEqual(view.representable?[3].transactions[0].title, "test description one")
    XCTAssertEqual(view.representable?[3].transactions[0].amount, "£10.00")
    XCTAssertEqual(view.representable?[3].transactions[0].iconName, "ic_entertainment")
    XCTAssertEqual(view.representable?[3].transactions[1].id, "testId2")
    XCTAssertEqual(view.representable?[3].transactions[1].title, "test description two")
    XCTAssertEqual(view.representable?[3].transactions[1].amount, "£20.00")
    XCTAssertEqual(view.representable?[3].transactions[1].iconName, "ic_take-away")
  }

  func testPossibleOutToDate() {

    let mockModels = [MockTransactionDomainModel.transactionOne,
                      MockTransactionDomainModel.transactionSix,
                      MockTransactionDomainModel.transactionThree,
                      MockTransactionDomainModel.transactionTwo,
                      MockTransactionDomainModel.transactionFour,
                      MockTransactionDomainModel.transactionFive]

    let presenter = TransactionsPresenter()
    presenter.view = view
    presenter.fetched(result: .success((mockModels, RepositoryErrors.dataOutdated)))
    XCTAssertEqual(view.representable?.count, 4)
    XCTAssertEqual(presenter.warning, "Connection error: the displayed data might not be up to date")

  }

  func testErrorPath() {

    presenter.fetched(result: .failure(RepositoryErrors.noResult))
    XCTAssertEqual(presenter.warning, "Connection error: no data available")
  }

  func testDisplayWarningLogic() {
    // Given
    presenter.warning = nil
    // When
    presenter.warning = "Something"
    // Then
    XCTAssertEqual(view.warning, "Something")
    XCTAssertEqual(view.warningCounter, 1)
    // When
    presenter.warning = nil
    // Then
    XCTAssertNil(view.warning)
    XCTAssertEqual(view.warningCounter, 2)
    // When
    presenter.warning = nil
    // Then
    XCTAssertNil(view.warning)
    XCTAssertEqual(view.warningCounter, 2)
  }
}
