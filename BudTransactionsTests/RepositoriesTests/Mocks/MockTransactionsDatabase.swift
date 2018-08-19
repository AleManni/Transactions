//
//  MockTransactionsDatabase.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
@testable import BudTransactions

final class MockTransactionsDatabase: TransactionsDatabaseInterface {

  var dbTransactions: [TransactionDomainModel] = []


  func save(domainModel: TransactionDomainModel, completion: @escaping (Bool) -> Void) {
    // empty implementation
  }

  func save(domainModels: [TransactionDomainModel], completion: @escaping (Bool) -> Void) {
    dbTransactions = domainModels
    completion(true)
  }

  func getAllTransactions() -> [TransactionDomainModel] {
    return dbTransactions
  }
}
