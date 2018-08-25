//
//  BudColour.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

/**
 Color convention for the Bud Demo app.
 */
public enum BudColour {
  case navyBlue
  case lightPurple
  case red
  case lightBlue
  case green
  case purple
  case grey50
  case white
  case custom(UIColor)

  public var rawValue: UIColor {
    switch self {
    case .navyBlue:
      return UIColor(hex: 0x021E63)
    case .lightPurple:
      return UIColor(hex: 0x9A3853)
    case .red:
      return UIColor(hex: 0xEF484D)
    case .lightBlue:
      return UIColor(hex: 0x4793ED)
    case .green:
      return UIColor(hex: 0x28F068)
    case .purple:
      return UIColor(hex: 0x522B5A)
    case .grey50:
      return UIColor(hex: 0xfafafa)
    case .white:
      return .white
    case .custom(let colour):
      return colour
    }
  }
}
