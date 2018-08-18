//
//  TransactionListNetworkModelTests.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
@testable import BudTransactions

class TransactionListNetworkModelTests: XCTestCase {

  func testMapToNetworkModel() {
    let mockJson = "transactions_list"
    guard let data = TestUtilities.loadJSON(mockJson) else {
      XCTFail("Failed to load json")
      return
    }
    guard let list = try? JSONDecoder().decode(TransactionListNetworkModel.self, from: data) as? TransactionListNetworkModel else {
      XCTFail("Failed to map object from provided json")
      return
  }
    XCTAssertEqual(list?.transactions.count, 10)

    XCTAssertEqual(list?.transactions.first?.id, "13acb877dc4d8030c5dacbde33d3496a2ae3asdc000db4c793bda9c3228baca1a28")
    XCTAssertEqual(list?.transactions.first?.date, "2018-03-19")
    XCTAssertEqual(list?.transactions.first?.description, "Forbidden planet")
    XCTAssertEqual(list?.transactions.first?.categoryID, 0)
    XCTAssertEqual(list?.transactions.first?.currency, .gbp)
    XCTAssertEqual(list?.transactions.first?.amount.value, 13)
    XCTAssertEqual(list?.transactions.first?.amount.currencyISO, .gbp)
    XCTAssertEqual(list?.transactions.first?.product.id, 4279)
    XCTAssertEqual(list?.transactions.first?.product.title.rawValue, "Lloyds Bank")
    XCTAssertEqual(list?.transactions.first?.product.icon, "https://storage.googleapis.com/budcraftstorage/uploads/products/lloyds-bank/Llyods_Favicon-1_161201_091641.jpg")
  }

}
