//
//  OperationResult.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

public enum OperationResult<T> {
  case success(T)
  case failure(Error)

  var type: T.Type {
    return T.self
  }
}
