//
//  TransactionsDatabaseInterface.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

protocol TransactionsDatabaseInterface: DataSource {
  func save(domainModel: TransactionDomainModel)
  func save(domainModels: [TransactionDomainModel])
  func getAllTransactions() -> [TransactionDomainModel]
}
