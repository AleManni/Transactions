//
//  MockTransactionsAPI.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
@testable import BudTransactions


final class MockTransactionsAPI: TransactionsAPIInterface {

  var success: Bool = true

  func getTransactions(completion: @escaping ((OperationResult<[TransactionDomainModel]>) -> Void)) {
    switch success {
    case true:
      completion(.success([MockTransactionDomainModel.transactionOne,
                           MockTransactionDomainModel.transactionTwo,
                           MockTransactionDomainModel.transactionThree]))
    default:
      completion(.failure(APIErrors.invalidRequest))
    }
  }
}
