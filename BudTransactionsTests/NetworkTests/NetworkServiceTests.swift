//
//  NetworkServiceTests.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
@testable import BudTransactions

class NetworkServiceTests: XCTestCase {

  let configurator = MockNetworkConfigurator()

  func testConfigureService() {
    configurator.headers = ["Test": "App:BudTransaction; App-version:0.1; App-build:2427(f188b9fc); OS:iOS; OS-version:11.4; ID:C15D6DC8-6CDC-4BE7-82C9-90A39C92656C"]
    let network = MockNetworkClient(configuration: configurator.configurationForCurrentEnvironment)

    let netService = NetworkService(networkClient: network, configurator: configurator)
    netService.configureService()

    guard let headers = network.configuration.httpAdditionalHeaders as? [String: String] else {
      XCTFail()
      return
    }
    XCTAssertEqual(headers["Test"], "App:BudTransaction; App-version:0.1; App-build:2427(f188b9fc); OS:iOS; OS-version:11.4; ID:C15D6DC8-6CDC-4BE7-82C9-90A39C92656C")
  }

  func testServiceFetchResult() {
    let network = MockNetworkClient(configuration: configurator.configurationForCurrentEnvironment)
    let netService = NetworkService(networkClient: network, configurator: configurator)

    let expect = expectation(description: "result fetched")
    let mockURL = URL(string: "www.test.com")

    
    netService.handleRequest(URLRequest(url: mockURL!), completion: { result in
      switch result {
      case .success(let data):
        guard let string = data as? String else {
          XCTFail("Unexpected result from network")
          return
        }
        XCTAssertEqual(string, "Test string")
      default:
        XCTFail("Unexpected error from network")
      }
      expect.fulfill()
    })

    wait(for: [expect], timeout: 2)
  }
}


