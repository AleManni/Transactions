//
//  TransactionsRepositoryTests.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
@testable import BudTransactions

final class TransactionsRepositoryTests: XCTestCase {

  let mockAPI = MockTransactionsAPI()
  let mockDB = MockTransactionsDatabase()

  func testSuccessfulFetchFromAPI() {
    // GIVEN
    let repo = TransactionsRepository(api: mockAPI, database: mockDB)
    // WHEN
    repo.getAllTransactions(completion: { result in
      // THEN
      switch result {
      case .failure:
        XCTFail()
      case .success(let transactions, let error):
        XCTAssertEqual(transactions.count, 3)
        XCTAssertNil(error)
      }
    })
  }

  func testFoldbackToDB() {
    // GIVEN
    let repo = TransactionsRepository(api: mockAPI, database: mockDB)
    mockDB.save(domainModels: [MockTransactionDomainModel.transactionOne,
                               MockTransactionDomainModel.transactionTwo,
                               MockTransactionDomainModel.transactionThree])
    mockAPI.success = false
    // WHEN
    repo.getAllTransactions(completion: { result in
      // THEN
      switch result {
      case .failure:
        XCTFail()
      case .success(let transactions, let error):
        XCTAssertEqual(transactions.count, 3)
        XCTAssertTrue(error is RepositoryErrors)
      }
    })
  }
}
