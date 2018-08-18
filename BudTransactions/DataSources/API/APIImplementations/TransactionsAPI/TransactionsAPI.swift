//
//  TransactionsAPI.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

final class TransactionsAPI: API {
  typealias NetworkModel = TransactionListNetworkModel

  var networkService: NetworkService

  init(_ networkService: NetworkService) {
    self.networkService = networkService
  }

  convenience init() {
    self.init(NetworkService.safeSession)
  }

  let transactionsRequest = APIRequest(endpoint: "5b33bdb43200008f0ad1e256",
                                       ids: nil,
                                       pathOptionalSuffix: nil,
                                       parameters: nil,
                                       body: nil,
                                       method: .get,
                                       apiVersion: .version2)

  func getTransactions(completion: @escaping ((OperationResult<[TransactionDomainModel]>) -> Void)) {
    getObject(request: transactionsRequest, completion: { result in
      switch result {
      case .success(let transactionList):
        let models = transactionList.transactions.compactMap {
          TransactionDomainModel(networkModel: $0)
        }
        completion(.success(models))
      case .failure(let error):
        completion(.failure(APIErrors.networkError(error)))
      }
    })
  }
}

extension TransactionDomainModel {

  init?(networkModel: TransactionNetworkModel) {
    guard let date = DateTools.dateFromAPIString(networkModel.date),
      let category = TransactionCategory(rawValue: networkModel.categoryID) else {
        return nil
    }
    self.id = networkModel.id
    self.date = date
    self.description = networkModel.description
    self.category = category
    self.currency = networkModel.currency
    self.amount = networkModel.amount.value
    self.product = ProductDomainModel(id: networkModel.product.id,
                                      name: networkModel.product.title.rawValue,
                                      iconURLString: networkModel.product.icon)
  }
}
