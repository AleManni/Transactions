//
//  MockTransactionDomainModel.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 19/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
@testable import BudTransactions

struct MockTransactionDomainModel {

  static func date(month: Int, day: Int) -> Date {
    var dateComponents = DateComponents()
    dateComponents.month = month
    dateComponents.day = day
    dateComponents.year = 2018
    dateComponents.hour = 12
    dateComponents.minute = 00
    return Calendar.current.date(from: dateComponents) ?? Date()
  }

  static let transactionOne = TransactionDomainModel(id: "testId1",
                                                     date: date(month: 8, day: 1),
                                                     description: "test description one",
                                                     category: .entertainment,
                                                     currency: .gbp,
                                                     amount: 10,
                                                     product: ProductDomainModel(id: 1,
                                                                                 name: "Product 1",
                                                                                 iconURLString: "www.test.com"))

  static let transactionTwo = TransactionDomainModel(id: "testId2",
                                                     date: date(month: 8, day: 1),
                                                     description: "test description two",
                                                     category: .takeaway,
                                                     currency: .gbp,
                                                     amount: 20,
                                                     product: ProductDomainModel(id: 1,
                                                                                 name: "Product 1",
                                                                                 iconURLString: "www.test.com"))

  static let transactionThree = TransactionDomainModel(id: "testId3",
                                                       date: date(month: 8, day: 2),
                                                       description: "test description three",
                                                       category: .utilities,
                                                       currency: .gbp,
                                                       amount: 87,
                                                       product: ProductDomainModel(id: 2,
                                                                                   name: "Product 2",
                                                                                   iconURLString: "www.test.com"))

  static let transactionFour = TransactionDomainModel(id: "testId4",
                                                       date: date(month: 8, day: 5),
                                                       description: "test description four",
                                                       category: .utilities,
                                                       currency: .gbp,
                                                       amount: 120,
                                                       product: ProductDomainModel(id: 2,
                                                                                   name: "Product 2",
                                                                                   iconURLString: "www.test.com"))

  static let transactionFive = TransactionDomainModel(id: "testId5",
                                                      date: date(month: 8, day: 5),
                                                      description: "test description five",
                                                      category: .takeaway,
                                                      currency: .gbp,
                                                      amount: 60,
                                                      product: ProductDomainModel(id: 2,
                                                                                  name: "Product 2",
                                                                                  iconURLString: "www.test.com"))

  static let transactionSix = TransactionDomainModel(id: "testId6",
                                                      date: date(month: 8, day: 7),
                                                      description: "test description six",
                                                      category: .grocery,
                                                      currency: .gbp,
                                                      amount: 90,
                                                      product: ProductDomainModel(id: 2,
                                                                                  name: "Product 2",
                                                                                  iconURLString: "www.test.com"))
}
