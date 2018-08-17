//
//  URLComponentExtensions.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

extension URLComponents {

  /**
   Returns the base URL component for the current Bud environment
   */
  public static func budBase() -> String {
    var baseURLString: String = ""
    #if PRODUCTION
    baseURLString = "www.mocky.io"
    #else
    assertionFailure("Could not determine environment")
    #endif
    return baseURLString
  }
}
