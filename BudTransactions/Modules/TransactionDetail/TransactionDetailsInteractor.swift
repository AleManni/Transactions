//
//  TransactionDetailsInteractor.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

import Foundation

final class TransactionDetailsInteractor {

  var data: TransactionDomainModel

  weak var output: TransactionDetailsInteractorOutput?

  init(data: TransactionDomainModel) {
    self.data = data
  }
}

extension TransactionDetailsInteractor: TransactionDetailsInteractorInput {
  func provideDataForView() {
    output?.fetched(data)
  }
}
