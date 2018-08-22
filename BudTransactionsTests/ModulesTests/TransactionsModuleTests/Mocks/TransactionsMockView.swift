//
//  TransactionsMockView.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
@testable import BudTransactions

final class TransactionsMockView: TransactionsViewInterface {

  var representable: TransactionsListRepresentable?
  var warning: String?
  var errorDescription: String?

  func showTransactions(transactions: TransactionsListRepresentable, warning: String?) {
    self.representable = transactions
    self.warning = warning
  }

  func showErrorDescription(_ description: String) {
    self.errorDescription = description
  }
}
