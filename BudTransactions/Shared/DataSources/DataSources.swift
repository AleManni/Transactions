//
//  DataSources.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

protocol DataSource {
}

protocol DatabaseModel {
  init?(domainModel: DomainModel)
}

