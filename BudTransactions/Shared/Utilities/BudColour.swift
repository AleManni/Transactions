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
  case primary
  case secondary
  case tertiary
  case steel
  case grey
  case greyWarm
  case greyCold
  case greyDark
  case greyLight
  case black
  case inputTextfieldBackground
  case dodgerBlueTwo
  case white
  case greenLight
  case greenDark
  case greenAlgae
  case labelDescriptor
  case link
  case cream
  case grey50
  case grey100
  case yellow
  case yellowLight
  case matchListHeaderBackground
  case custom(UIColor)

  public var rawValue: UIColor {
    switch self {
    case .primary:
      return UIColor(hex: 0x32_cd_4d)
    case .secondary:
      return .white
    case .tertiary:
      return UIColor(hex: 0x12bf2f)
    case .steel:
      return UIColor(hex: 0x8e8e93)
    case .grey:
      return UIColor(hex: 0xc8c7cc)
    case .greyWarm:
      return UIColor(hex: 0x9b9b9b)
    case .greyCold:
      return UIColor(hex: 0xefeff4)
    case .greyDark:
      return UIColor(hex: 0x95_98_9a)
    case .greyLight:
      return UIColor(hex: 0xFCFCFC)
    case .inputTextfieldBackground:
      return UIColor(hex: 0xf4f4f4)
    case .black:
      return .black
    case .dodgerBlueTwo:
      return UIColor(hex: 0x419cff)
    case .white:
      return .white
    case .greenLight:
      return UIColor(hex: 0x18ce36, alpha: 0.05)
    case .greenDark:
      return UIColor(hex: 0x139028)
    case .greenAlgae:
      return UIColor(hex: 0x2ddb4a)
    case .labelDescriptor:
      return UIColor(hex: 0x9b9b9b)
    case .link:
      return UIColor(hex: 0x18ce36)
    case .cream:
      return UIColor(hex: 0xf5f5f5)
    case .grey50:
      return UIColor(hex: 0xfafafa)
    case .grey100:
      return UIColor(hex: 0xf5f5f5)
    case .yellow:
      return UIColor(hex: 0xfecb2f)
    case .yellowLight:
      return UIColor(hex: 0xffd75d)
    case .matchListHeaderBackground:
      return UIColor(hex: 0x0c_bf_2a)
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
