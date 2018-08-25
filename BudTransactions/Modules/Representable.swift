//
//  Representable.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

/**
 Representable structures are the output of the Presenters to the View interfaces.
 They contain the data binding and transformation logic from one or many Domain Model(s) to a single struct ready to be displayed by the View without any further transformation
 */
public protocol Representable {
  init?(model: DomainModel?...)
}
