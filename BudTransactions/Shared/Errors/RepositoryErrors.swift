//
//  RepositoryErrors.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

/***
 Specialized Error type for repository classes
 */
enum RepositoryErrors: Error {
  case noResult
  case dataOutdated
}

extension RepositoryErrors: CustomStringConvertible {

  public var description: String {
    switch self {
    case .noResult:
      return "Connection error: no data available"
    case .dataOutdated:
      return "Connection error: the displayed data might not be up to date"
    }
  }
}
