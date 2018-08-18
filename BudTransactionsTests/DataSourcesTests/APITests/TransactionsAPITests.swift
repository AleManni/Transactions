//
//  TransactionsAPITests.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
@testable import BudTransactions

class TransactionsAPITests: XCTestCase {

  private func APIMockNetworkService(mockJsonName: String) -> NetworkService {
    let configurator = MockNetworkConfigurator()
    let mockNetwork = APIMockNetworkClient(configuration: configurator.configurationForCurrentEnvironment)
    mockNetwork.mockJson = mockJsonName
    return NetworkService(networkClient: mockNetwork, configurator: configurator)
  }

  func testGetTransactions() {
    // GIVEN
    let networkService = APIMockNetworkService(mockJsonName: "transactions_list")
    networkService.configureService()
    let transactionsAPI = TransactionsAPI(networkService)
    let expect = expectation(description: "get transaction list")
    // WHEN
    transactionsAPI.getTransactions(completion: { result in
      switch result {
    // THEN
      case .failure(let error):
        XCTFail("Failed with error: \(error.localizedDescription)")
      case .success(let transactions):
        XCTAssertEqual(transactions.count, 10)

        XCTAssertEqual(transactions.first?.id, "13acb877dc4d8030c5dacbde33d3496a2ae3asdc000db4c793bda9c3228baca1a28")
        XCTAssertEqual(transactions.first?.date.description(with: Locale(identifier: "en_US_POSIX")), "Monday, March 19, 2018 at 12:00:00 AM Greenwich Mean Time")
        XCTAssertEqual(transactions.first?.description, "Forbidden planet")
        XCTAssertEqual(transactions.first?.category, .entertainment)
        XCTAssertEqual(transactions.first?.currency, .gbp)
        XCTAssertEqual(transactions.first?.amount, 13)
        XCTAssertEqual(transactions.first?.product.id, 4279)
        XCTAssertEqual(transactions.first?.product.name, "Lloyds Bank")
        XCTAssertEqual(transactions.first?.product.iconURLString, "https://storage.googleapis.com/budcraftstorage/uploads/products/lloyds-bank/Llyods_Favicon-1_161201_091641.jpg")

        XCTAssertEqual(transactions.last?.id, "13acb877dc4d8030c5dacbdewfdge33d3496a2ae3c000db4c793bda9c3228baca1a28")
        XCTAssertEqual(transactions.last?.date.description(with: Locale(identifier: "en_US_POSIX")), "Thursday, March 1, 2018 at 12:00:00 AM Greenwich Mean Time")
        XCTAssertEqual(transactions.last?.description, "Dumplings legend")
        XCTAssertEqual(transactions.last?.category, .eatOut)
        XCTAssertEqual(transactions.last?.currency, .gbp)
        XCTAssertEqual(transactions.last?.amount, 77.3)
        XCTAssertEqual(transactions.last?.product.id, 4279)
        XCTAssertEqual(transactions.last?.product.name, "Lloyds Bank")
        XCTAssertEqual(transactions.last?.product.iconURLString, "https://storage.googleapis.com/budcraftstorage/uploads/products/lloyds-bank/Llyods_Favicon-1_161201_091641.jpg")

        expect.fulfill()
      }
    })
    wait(for: [expect], timeout: 2)
  }
}
