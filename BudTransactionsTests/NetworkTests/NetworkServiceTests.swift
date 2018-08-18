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

  var netService: NetworkService?
  var configurator: MockNetworkConfigurator?
  var network: MockNetworkClient?
  var evaluateHeaders: ((Any?) -> Void)?

  override func setUp() {
  }

  override func tearDown() {
    evaluateHeaders = nil
  }

  func testConfigureService() {
    configurator = MockNetworkConfigurator()
    configurator?.headers = ["Test": "App:BudTransaction; App-version:0.1; App-build:2427(f188b9fc); OS:iOS; OS-version:11.4; ID:C15D6DC8-6CDC-4BE7-82C9-90A39C92656C"]
    network = MockNetworkClient(configuration: configurator!.configurationForCurrentEnvironment)
    guard let network = network else {
      XCTFail()
      return
    }

    netService?.configureService()

    guard let headers = network.configuration.httpAdditionalHeaders as? [String: String] else {
      XCTFail()
      return
    }
    XCTAssertEqual(headers["Test"], "App:BudTransaction; App-version:0.1; App-build:2427(f188b9fc); OS:iOS; OS-version:11.4; ID:C15D6DC8-6CDC-4BE7-82C9-90A39C92656C")
  }
}
