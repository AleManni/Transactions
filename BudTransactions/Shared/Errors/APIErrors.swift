//
//  APIErrors.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

/***
 Specialized error type for API classes
 */
public enum APIErrors: Error {
  case deserializationError(Error)
  case incorrectDataType
}
