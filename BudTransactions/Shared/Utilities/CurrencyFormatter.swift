//
//  CurrencyFormatter.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

struct CurrencyFormatter {

  static let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
}()

  static func stringRepresentation(for value: Double, currency: Currency) -> String? {
    formatter.currencyCode = currency.rawValue
    return formatter.string(from: NSNumber(value: value))
  }
}
