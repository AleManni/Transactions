//
//  TransactionsDatabaseTests.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
import RealmSwift
@testable import BudTransactions

final class TransactionsDatabaseTests: XCTestCase {

  let database = TransactionsDatabase()

  override func setUp() {
    super.setUp()
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
  }

  func testSaveATransactions() {
    let _ = try! Realm()
    let expect = expectation(description: "Saved in DB")
    let mockTransactions = [MockTransactionDomainModel.transactionOne,
                            MockTransactionDomainModel.transactionTwo,
                            MockTransactionDomainModel.transactionThree]
    database.save(domainModels: mockTransactions, completion: { [weak self] _ in
      guard let `self` = self else {
        XCTFail()
        return
      }
      let transactions = self.database.objects(ofType: TransactionRealmModel.self)
      let products = self.database.objects(ofType: ProductRealmModel.self)
      XCTAssertEqual(transactions.count, 3)
      XCTAssertEqual(products.count, 2)
      expect.fulfill()
    })
    wait(for: [expect], timeout: 1)
  }

  func testGetAllTransactions() {
    let _ = try! Realm()
    let expect = expectation(description: "Saved in DB")
    let mockTransactions = [MockTransactionDomainModel.transactionOne,
                            MockTransactionDomainModel.transactionTwo,
                            MockTransactionDomainModel.transactionThree]

    database.save(domainModels: mockTransactions, completion: { [weak self] _ in
      guard let `self` = self else {
        XCTFail()
        return
      }
      let transactionModels = self.database.getAllTransactions()
      XCTAssertEqual(transactionModels.count, 3)

      XCTAssertEqual(transactionModels.first?.id, "testId1")
      XCTAssertNotNil(transactionModels.first?.date)
      XCTAssertEqual(transactionModels.first?.description, "test description one")
      XCTAssertEqual(transactionModels.first?.category, .entertainment)
      XCTAssertEqual(transactionModels.first?.currency, .gbp)
      XCTAssertEqual(transactionModels.first?.amount, 10)
      XCTAssertEqual(transactionModels.first?.product.id, 1)
      XCTAssertEqual(transactionModels.first?.product.name, "Product 1")
      XCTAssertEqual(transactionModels.first?.product.iconURLString, "www.test.com")

      XCTAssertEqual(transactionModels[1].id, "testId2")
      XCTAssertNotNil(transactionModels[1].date)
      XCTAssertEqual(transactionModels[1].description, "test description two")
      XCTAssertEqual(transactionModels[1].category, .takeaway)
      XCTAssertEqual(transactionModels[1].currency, .gbp)
      XCTAssertEqual(transactionModels[1].amount, 20)
      XCTAssertEqual(transactionModels[1].product.id, 1)
      XCTAssertEqual(transactionModels[1].product.name, "Product 1")
      XCTAssertEqual(transactionModels[1].product.iconURLString, "www.test.com")

      XCTAssertEqual(transactionModels[2].id, "testId3")
      XCTAssertNotNil(transactionModels[2].date)
      XCTAssertEqual(transactionModels[2].description, "test description three")
      XCTAssertEqual(transactionModels[2].category, .utilities)
      XCTAssertEqual(transactionModels[2].currency, .gbp)
      XCTAssertEqual(transactionModels[2].amount, 87)
      XCTAssertEqual(transactionModels[2].product.id, 2)
      XCTAssertEqual(transactionModels[2].product.name, "Product 2")
      XCTAssertEqual(transactionModels[2].product.iconURLString, "www.test.com")

      expect.fulfill()
    })
    wait(for: [expect], timeout: 1)
  }
}
