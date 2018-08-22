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
    case .red:
      return UIColor(hex: 0xEF484D)
    case .lightBlue:
      return UIColor(hex: 0x4793ED)
    case .green:
      return UIColor(hex: 0x2AFD6E)
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

extension UIColor {
  convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
    let red = CGFloat((hex & 0xff0000) >> 16) / 255.0
    let green = CGFloat((hex & 0xff00) >> 8) / 255.0
    let blue = CGFloat(hex &  0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
