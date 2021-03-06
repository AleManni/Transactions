//
//  TransactionDetailsNavigation.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

extension NavigationService: TransactionsRouter {
  func didRequestDetailsFor(transaction: TransactionDomainModel) {
   let view = factory.buildTransactionsDetailsView(data: transaction)
    showController(view)
  }

}
