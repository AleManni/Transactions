//
//  TransactionDetailsMockView.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 23/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
@testable import BudTransactions

final class TransactionDetailsMockView: TransactionDetailsViewInterface {

  var representable: TransactionDetailsRepresentable?

  func showTransaction(_ transaction: TransactionDetailsRepresentable) {
    self.representable = transaction
  }
}

