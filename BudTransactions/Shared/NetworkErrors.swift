//
//  NetworkErrors.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/07/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

public enum NetworkErrors: Error {
  case jsonDeserializationError(Error)
  case noResult
}
