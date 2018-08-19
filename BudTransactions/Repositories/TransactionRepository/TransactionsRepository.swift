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

  func getAllTransactions(completion: @escaping (OperationResult<[TransactionDomainModel]>) -> Void) {
    guard ReachabilityService.shared.isReachable else {
      completion(.success(database.getAllTransactions()))
      return
    }
    api.getTransactions(completion: { [weak self] result in
      guard let `self` = self else {
        return
      }
      switch result {
      case .success(let transactions):
        self.database.save(domainModels: transactions, completion: { _ in })
        completion(result)
      case .failure:
        // foldback to db
        completion(.success(self.database.getAllTransactions()))
      }
    })
  }
}
