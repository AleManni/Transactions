//
//  TransactionRepresentable.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

struct TransactionRepresentable: Representable {
  let id: String
  let iconName: String
  let title: String
  let amount: String

  init?(model: DomainModel?...) {
    guard let model = model.first(where: { $0 is TransactionDomainModel }) as? TransactionDomainModel,
    let amountString =  TransactionRepresentable.format(value: model.amount, currencyCode: model.currency.rawValue) else {
      return nil
    }
    self.id = model.id
    self.iconName = model.category.iconName
    self.title = model.description
    self.amount = amountString
  }
}

// MARK: Utility
extension TransactionRepresentable {
  private static func format(value: Double, currencyCode: String) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = currencyCode
    return formatter.string(from: NSNumber(value: value))
  }
}
