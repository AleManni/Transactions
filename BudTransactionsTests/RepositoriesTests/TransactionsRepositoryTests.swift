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
    let repo = TransactionsRepository(api: mockAPI, database: mockDB)

    repo.getAllTransactions(completion: { result in
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
    let repo = TransactionsRepository(api: mockAPI, database: mockDB)
    repo.getAllTransactions(completion: { _ in })
    mockAPI.success = false
    repo.getAllTransactions(completion: { result in
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
