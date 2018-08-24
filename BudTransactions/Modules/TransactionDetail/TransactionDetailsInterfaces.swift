//
//  TransactionDetailsInterfaces.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

protocol TransactionDetailsInteractorInput: class {
  func provideDataForView()
}

protocol TransactionDetailsInteractorOutput: class {
  func fetched(_ transaction: TransactionDomainModel)
}

protocol TransactionDetailsPresenterInput: class {
  func updateView()
}

protocol TransactionDetailsViewInterface: class {
  func showTransaction(_ transaction: TransactionDetailsRepresentable)
}
