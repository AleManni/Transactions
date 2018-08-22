//
//  TransactionsInteractor.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

final class TransactionsInteractor: TransactionsInteractorInput {

  let repository: TransactionsRepositoryInterface
  weak var output: TransactionsInteractorOutput?

  init(repository: TransactionsRepositoryInterface) {
    self.repository = repository
  }

  func fetchTransactions() {
    repository.getAllTransactions(completion: { [weak self] result in
      self?.output?.fetched(result: result)
      })
    }
}
