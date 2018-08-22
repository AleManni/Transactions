//
//  TransactionsRepository.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

final class TransactionsRepository: TransactionsRepositoryInterface {

  let api: TransactionsAPIInterface
  let database: TransactionsDatabaseInterface

  init(api: TransactionsAPIInterface, database: TransactionsDatabaseInterface) {
    self.api = api
    self.database = database
  }

  func getAllTransactions(completion: @escaping (OperationResult<(models: [TransactionDomainModel], error: Error?)>) -> Void) {
    guard ReachabilityService.shared.isReachable else {
      completion(.success((database.getAllTransactions(), RepositoryErrors.dataOutdated)))
      return
    }
    api.getTransactions(completion: { [weak self] result in
      guard let `self` = self else {
        return
      }
      switch result {
      case .success(let transactions):
        self.database.save(domainModels: transactions, completion: { _ in })
        completion(.success((models: transactions, nil)))
      case .failure(let error):
        // fold back to db if we have some data
         let transactions = self.database.getAllTransactions()
         if transactions.count > 0 {
        completion(.success((self.database.getAllTransactions(), RepositoryErrors.dataOutdated)))
         } else {
          completion(.failure(error))
        }
      }
    })
  }
}
