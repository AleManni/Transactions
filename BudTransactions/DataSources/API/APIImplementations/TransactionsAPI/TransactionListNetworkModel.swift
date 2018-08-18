//
//  TransactionListNetworkModel.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

// To parse the JSON, add this file to your project and do:
//
//   let transactions = try? newJSONDecoder().decode(Transactions.self, from: jsonData)

import Foundation

struct TransactionListNetworkModel: Codable {
  let transactions: [TransactionNetworkModel]
}

struct TransactionNetworkModel: Codable {
  let id, date, description: String
  let categoryID: Int
  let currency: Currency
  let amount: Amount
  let product: Product

  enum CodingKeys: String, CodingKey {
    case id, date, description
    case categoryID = "category_id"
    case currency, amount, product
  }
}

struct Amount: Codable {
  let value: Double
  let currencyISO: Currency

  enum CodingKeys: String, CodingKey {
    case value
    case currencyISO = "currency_iso"
  }
}

struct Product: Codable {
  let id: Int
  let title: Title
  let icon: String
}

enum Title: String, Codable {
  case lloydsBank = "Lloyds Bank"
}
