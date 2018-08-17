//
//  DebugLog.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

public func debugLog(_ string: String) {
  #if DEBUG
  print(string)
  #endif
}
