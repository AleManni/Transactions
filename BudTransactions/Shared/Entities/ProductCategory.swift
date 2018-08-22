//
//  ProductCategory.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

public enum TransactionCategory: Int {
  case entertainment = 0
  case utilities = 1
  case restaurants = 5
  case takeaway = 6
  case grocery = 7

  var iconName: String {
    switch self {
    case .entertainment:
      return "ic_entertaintment"
    case .utilities:
      return "ic_utilities"
    case .restaurants:
      return "ic_restaurant"
    case .takeaway:
      return "ic_take-away"
    case .grocery:
      return "ic_groceries"
    }
  }

  var description: String {
    switch self {
    case .entertainment:
      return "entertainment"
    case .utilities:
      return "utilities"
    case .restaurants:
      return "restaurants"
    case .takeaway:
      return "take-away"
    case .grocery:
      return "groceries"
    }
  }
}
