//
//  NetworkErrors.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 19/07/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

/***
 Specialized Error type for the NetworkService class
 */
public enum NetworkErrors: Error {
  case invalidURL
  case jsonDeserializationError(Error)
  case noResult
}
