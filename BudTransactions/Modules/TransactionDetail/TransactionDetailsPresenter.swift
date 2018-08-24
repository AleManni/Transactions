//
//  TransactionDetailsPresenter.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

final class TransactionDetailsPresenter {
  weak var view: TransactionDetailsViewInterface?
  var interactor: TransactionDetailsInteractorInput?
}

extension TransactionDetailsPresenter: TransactionDetailsPresenterInput {
  func updateView() {
    interactor?.provideDataForView()
  }
}

extension TransactionDetailsPresenter: TransactionDetailsInteractorOutput {
  func fetched(_ transaction: TransactionDomainModel) {
    guard let representable = TransactionDetailsRepresentable(model: transaction) else {
      return
    }
    view?.showTransaction(representable)
  }
}
