//
//  TransactionRepositoryInterface.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

protocol TransactionsRepositoryInterface {
  var api: TransactionsAPIInterface { get }
  var database: TransactionsDatabaseInterface { get }
  func getAllTransactions(completion: @escaping (OperationResult<(models: [TransactionDomainModel], error: Error?)>) -> Void)
}
