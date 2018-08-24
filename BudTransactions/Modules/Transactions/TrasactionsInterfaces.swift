//
//  TrasactionsInterfaces.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

protocol TransactionsInteractorInput: class {
  func fetchTransactions()
}

protocol TransactionsInteractorOutput: class {
  func fetched(result: OperationResult<(models: [TransactionDomainModel], error: Error?)>)
}

protocol TransactionsViewInterface: class {
  func showTransactions(transactions: TransactionsListRepresentable)
  func isLoading(_ isLoading: Bool)
  func displayWarning(_ warning: String?)
}

protocol TransactionsPresenterInput: class {
  func updateView()
  func showDetailsForTransaction(id: String)
  func viewDidReceiveReachabilityWarning(_ warning: String?)
}

protocol TransactionsRouter: class {
  func didRequestDetailsFor(transaction: TransactionDomainModel)
}
