//
//  APIMockNetworkClient.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
@testable import BudTransactions


class APIMockNetworkClient: NetworkClient {

  var mockJson: String?

  var configuration: URLSessionConfiguration

  init(configuration: URLSessionConfiguration) {
    self.configuration = configuration
  }

  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void) {
    guard let mockJson = mockJson else {
      assertionFailure("mockJson file name needs to be set for ths mock to work")
      return
    }
    if let data = TestUtilities.loadJSON(mockJson) {
      completion(.success(data))
    } else {
      completion(.failure(NetworkErrors.noResult))
    }
  }
}
