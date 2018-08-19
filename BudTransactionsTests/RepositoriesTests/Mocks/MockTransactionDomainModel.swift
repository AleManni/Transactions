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

  static let transactionOne = TransactionDomainModel(id: "testId1",
                                                     date: Date(timeIntervalSinceReferenceDate: 1),
                                                     description: "test description one",
                                                     category: .entertainment,
                                                     currency: .gbp,
                                                     amount: 10,
                                                     product: ProductDomainModel(id: 1,
                                                                                 name: "Product 1",
                                                                                 iconURLString: "www.test.com"))

  static let transactionTwo = TransactionDomainModel(id: "testId2",
                                                     date: Date(timeIntervalSinceReferenceDate: 1),
                                                     description: "test description two",
                                                     category: .eatOut,
                                                     currency: .gbp,
                                                     amount: 20,
                                                     product: ProductDomainModel(id: 1,
                                                                                 name: "Product 1",
                                                                                 iconURLString: "www.test.com"))

  static let transactionThree = TransactionDomainModel(id: "testId3",
                                                     date: Date(timeIntervalSinceReferenceDate: 1),
                                                     description: "test description three",
                                                     category: .utilities,
                                                     currency: .gbp,
                                                     amount: 87,
                                                     product: ProductDomainModel(id: 2,
                                                                                 name: "Product 2",
                                                                                 iconURLString: "www.test.com"))

}
