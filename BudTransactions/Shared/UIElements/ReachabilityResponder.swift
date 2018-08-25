//
//  ReachabilityResponder.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

/**
 This protocol is implmented by UI classes that can respond to a network reachability change status.
 The View will then delegate to the Presenter in order to decide how to respond to the event.
 */
protocol ReachabilityResponder: class {
  func networkChangedStatus(isAvailable: Bool, info: String?)
}
