//
//  TransactionsNavigation.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

extension NavigationService {
/*
   Sets the initial module for the app (as such this class doesn't comform to a routing protocol)
 */
  func showTransactionNavigation() {
    let transactionViewController = factory.buildTransactionsView(router: self)
    navigationController.setViewControllers([transactionViewController], animated: true)
  }
}
