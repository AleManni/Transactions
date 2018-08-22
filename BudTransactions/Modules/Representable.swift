//
//  Representable.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

public protocol Representable {
  init?(model: DomainModel?...)
}
