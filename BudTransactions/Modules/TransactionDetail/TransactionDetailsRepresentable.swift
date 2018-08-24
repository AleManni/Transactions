//
//  TransactionDetailsRepresentable.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

struct TransactionDetailsRepresentable: Representable {
  let dateString: String
  let description: String
  let categoryDescription: String
  let categoryColour: UIColor
  let categoryIconName: String
  let amount: String
  let productName: String
  let productURLString: String

  init?(model: DomainModel?...) {
    guard let model = model.first(where: { $0 is TransactionDomainModel }) as? TransactionDomainModel,
    let amount = CurrencyFormatter.stringRepresentation(for: model.amount, currency: model.currency) else {
      return nil
    }
    self.dateString = TransactionDetailsRepresentable.dateFormatter.string(from: model.date)
    self.description = model.description
    self.categoryDescription = model.category.description.localizedCapitalized
    self.categoryColour = model.category.associatedColour
    self.categoryIconName = model.category.iconName
    self.amount = amount
    self.productName = model.product.name
    self.productURLString = model.product.iconURLString
  }

  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, d MMM"
    return formatter
  }()
}
