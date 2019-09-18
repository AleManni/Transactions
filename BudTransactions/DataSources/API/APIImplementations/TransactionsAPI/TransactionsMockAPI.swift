//
//  TransactionsMockAPI.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/09/2019.
//  Copyright © 2019 Alessandro Manni. All rights reserved.
//

import Foundation


final class TransactionsMockAPI: TransactionsAPIInterface, API {

  var networkService: NetworkService?


  typealias NetworkModel = TransactionListNetworkModel

  func getTransactions(completion: @escaping ((OperationResult<[TransactionDomainModel]>) -> Void)) {
    completion(OperationResult<[TransactionDomainModel]>.success(testsTransactions(number: 15)))
  }

  private func testsTransactions(number: Int) -> [TransactionDomainModel] {

    return (0..<number).map {
      return TransactionDomainModel(id: String($0),
                                    date: Date(),
                                    description: "Test transaction n \($0)",
                                    category: (TransactionCategory.allCases[safe: $0] ?? .entertainment),
                                    currency: .gbp,
                                    amount: Double(10 * $0),
                                    product: ProductDomainModel.init(id: $0,
                                                                     name: "Test product",
                                                                     iconURLString: "https://storage.googleapis.com/budcraftstorage/uploads/products/lloyds-bank/Llyods_Favicon-1_161201_091641.jpg"))

    }
  }
}
