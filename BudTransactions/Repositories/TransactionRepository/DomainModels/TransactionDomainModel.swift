//
//  TransactionDomainModel.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

struct TransactionDomainModel: DomainModel {
let id: String
let date: Date
let description: String
let category: TransactionCategory
let currency: Currency
let amount: Double
let product: ProductDomainModel
}
