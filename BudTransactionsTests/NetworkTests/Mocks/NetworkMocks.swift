//
//  NetworkMocks.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit
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

  var mockJson: String?

  var expectedResult: NetworkResult = .success("Test string")

  var configuration: URLSessionConfiguration

  init(configuration: URLSessionConfiguration) {
    self.configuration = configuration
  }

  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void) {
    completion(expectedResult)
  }

}

class MockImageNetworkClient: NetworkClient {

  lazy var expectedResult: NetworkResult = {
    let image = UIImage(named: "image_placeholder")
    let data = UIImageJPEGRepresentation(image!, 1)
    return .success(data)
  }()

  var configuration: URLSessionConfiguration

  init(configuration: URLSessionConfiguration) {
    self.configuration = configuration
  }

  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void) {
    completion(expectedResult)
  }
}
