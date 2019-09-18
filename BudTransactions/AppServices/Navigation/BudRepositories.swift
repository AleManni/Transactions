//
//  BudRepositories.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/09/2019.
//  Copyright © 2019 Alessandro Manni. All rights reserved.
//

protocol BudRepositories {
  var transactionsRepository: TransactionsRepositoryInterface { get }
}

final class ProductionRepositories: BudRepositories {
  var transactionsRepository: TransactionsRepositoryInterface =
    TransactionsRepository(api: TransactionsAPI(NetworkService.safeSession),
                           database: TransactionsDatabase())
}

final class TestsRepositories: BudRepositories {
  var transactionsRepository: TransactionsRepositoryInterface =
    TransactionsRepository(api: TransactionsMockAPI(),
                           database: TransactionsDatabase())
}

