//
//  ReachabilityResponder.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

protocol ReachabilityResponder: class {
  func networkChangedStatus(isAvailable: Bool, info: String?)
}
