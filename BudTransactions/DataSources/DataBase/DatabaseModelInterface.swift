//
//  DatabaseModelInterface.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

/**
 Database models (Realm models) are instantiated with an instance of the corresponding app domain model
 */
protocol DatabaseModel {
  init?(domainModel: DomainModel)
}
