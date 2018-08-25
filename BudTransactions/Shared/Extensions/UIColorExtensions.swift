//
//  UIColorExtensions.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 25/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
    let red = CGFloat((hex & 0xff0000) >> 16) / 255.0
    let green = CGFloat((hex & 0xff00) >> 8) / 255.0
    let blue = CGFloat(hex &  0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
