//
//  TransactionsDatabase.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

import RealmSwift

final class TransactionsDatabase: MainDatabase, TransactionsDatabaseInterface {

  func save(domainModel: TransactionDomainModel) {
    guard let transactionObject = TransactionRealmModel(domainModel: domainModel),
      let productObject = ProductRealmModel(domainModel: domainModel.product) else {
        return
    }

    write(transactionObject, shouldUpdateIfExists: true)
    write(productObject, shouldUpdateIfExists: true)
  }

  func save(domainModels: [TransactionDomainModel]) {
    domainModels.forEach {
      save(domainModel: $0)
    }
  }

  func getAllTransactions() -> [TransactionDomainModel] {
    let transactions = objects(ofType: TransactionRealmModel.self)
    let models: [TransactionDomainModel] = transactions.compactMap {
      guard let realmProduct = object(ofType: ProductRealmModel.self, primaryKey: $0.productId) else {
        return nil
      }
      return TransactionDomainModel(transactionDBModel: $0, productDBModel: realmProduct)
    }
    return models
  }
}

private extension TransactionDomainModel {
  init?(transactionDBModel: TransactionRealmModel, productDBModel: ProductRealmModel) {
    guard let category = TransactionCategory(rawValue: transactionDBModel.categoryID),
      let currency = Currency(rawValue: transactionDBModel.currency) else {
        return nil
    }
    self.id = transactionDBModel.id
    self.date = transactionDBModel.date
    self.category = category
    self.currency = currency
    self.description = transactionDBModel.descriptionString
    self.amount = transactionDBModel.amount
    self.product = ProductDomainModel(id: productDBModel.id,
                                      name: productDBModel.name,
                                      iconURLString: productDBModel.iconURLString)
  }
}
