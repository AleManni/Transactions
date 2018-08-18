//
//  NetworkMocks.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
@testable import BudTransactions


class MockNetworkConfigurator: NetworkConfigurator {

  var headers: [String: Any]?

  var configurationForCurrentEnvironment: URLSessionConfiguration {
    let config = URLSessionConfiguration.default
    config.httpAdditionalHeaders = headers
    return config
  }
}

class MockNetworkClient: NetworkClient {

  var configuration: URLSessionConfiguration

  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void) {
    // Empty implementation
  }

  init(configuration: URLSessionConfiguration) {
    self.configuration = configuration
  }
}
