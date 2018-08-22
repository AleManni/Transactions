//
//  TransactionsPresenter.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

final class TransactionsPresenter: TransactionsInteractorOutput {

  weak var view: TransactionsViewInterface?
  var interactor: TransactionsInteractor?
  weak var router: TransactionsRouter?

  var transactions: [TransactionDomainModel] = []
  var error: Error?

  lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d"
    return formatter
  }()

  func fetched(result: OperationResult<(models: [TransactionDomainModel], error: Error?)>) {
    switch result {
    case .failure(let error):
      view?.showErrorDescription(errorDescription(error) ?? "")
    case .success((let transactions, let error)):
      self.transactions = transactions
      let representableList = generateRepresentables(models: transactions)
      view?.showTransactions(transactions: representableList, warning: errorDescription(error))
    }
  }

  /*
   This function
 */
  private func generateRepresentables(models: [TransactionDomainModel]) -> TransactionsListRepresentable {
    let tuples: [(Date, [TransactionRepresentable])] = Dictionary.init(grouping: transactions, by: { $0.date })
      .mapValues { $0.compactMap { TransactionRepresentable(model: $0) }}
      .map { key, value in
      return (key, value)
    }.sorted(by: { $0.0 > $1.0 })

    let representables: TransactionsListRepresentable = tuples.map { (date, transactions) in
      let title = dateFormatter.string(from: date)
      return (title: title, transactions: transactions)
    }
    return representables
  }

  private func errorDescription(_ error: Error?) -> String? {
    guard error != nil else {
      return nil
    }
    guard let error = error as? RepositoryErrors else {
      return "There is a problem with our servers. Please try again later."
    }
    return error.description
  }
}

  extension TransactionsPresenter: TransactionsPresenterInput {

  func updateView() {
    interactor?.fetchTransactions()
  }

  func showDetailsForTransaction(id: String) {
    guard let model = transactions.first(where: { $0.id == id }) else {
      return
    }
    router?.didRequestDetailsFor(transaction: model)
  }
}
