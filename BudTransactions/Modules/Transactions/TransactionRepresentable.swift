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
    let amountString =  CurrencyFormatter.stringRepresentation(for: model.amount, currency: model.currency)  else {
      return nil
    }
    self.id = model.id
    self.iconName = model.category.iconName
    self.title = model.description
    self.amount = amountString
  }
}
