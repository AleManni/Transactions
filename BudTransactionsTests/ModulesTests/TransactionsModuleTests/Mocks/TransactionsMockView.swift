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
  var warningCounter = 0

  func showTransactions(transactions: TransactionsListRepresentable) {
    self.representable = transactions
  }

  func isLoading(_ isLoading: Bool) {
    // empty
  }

  func displayWarning(_ warning: String?) {
    self.warning = warning
    warningCounter += 1
  }
}
