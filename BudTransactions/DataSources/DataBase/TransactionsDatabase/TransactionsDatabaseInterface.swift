//
//  TransactionsDatabaseInterface.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

protocol TransactionsDatabaseInterface: DataSource {
  func save(domainModel: TransactionDomainModel, completion: @escaping (Bool) -> Void)
  func save(domainModels: [TransactionDomainModel], completion: @escaping (Bool) -> Void)
  func getAllTransactions() -> [TransactionDomainModel]
}
