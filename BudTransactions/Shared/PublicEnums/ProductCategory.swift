//
//  ProductCategory.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

/**
 Spend categories as deducted by the provied data 
 */
public enum TransactionCategory: Int, CaseIterable {
  case entertainment = 0
  case utilities = 1
  case restaurants = 5
  case takeaway = 6
  case grocery = 7

  var iconName: String {
    switch self {
    case .entertainment:
      return "ic_entertainment"
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

  var associatedColour: UIColor {
    switch self {
    case .entertainment:
      return BudColour.lightPurple.rawValue
    case .utilities:
      return BudColour.purple.rawValue
    case .restaurants:
      return BudColour.red.rawValue
    case .takeaway:
      return BudColour.lightBlue.rawValue
    case .grocery:
      return BudColour.green.rawValue
    }
  }

}
