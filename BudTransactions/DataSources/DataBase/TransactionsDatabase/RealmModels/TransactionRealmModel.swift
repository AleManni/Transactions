//
//  TransactionRealmModel.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import RealmSwift

final class TransactionRealmModel: Object {
  @objc dynamic var id: String = ""
  @objc dynamic var date: Date = Date()
  @objc dynamic var descriptionString: String = ""
  @objc dynamic var categoryID: Int = -1
  @objc dynamic var currency: String = ""
  @objc dynamic var amount: Double = 0
  @objc dynamic var productId: Int = -1


  convenience init(id: String,
                   date: Date,
                   description: String,
                   category: TransactionCategory,
                   currency: Currency,
                   amount: Double,
                   productId: Int) {
    self.init()
    self.id = id
    self.date = date
    self.descriptionString = description
    self.categoryID = category.rawValue
    self.currency = currency.rawValue
    self.amount = amount
    self.productId = productId
  }

  override class func primaryKey() -> String? {
    return "id"
  }
}

extension TransactionRealmModel: DatabaseModel {
  convenience init?(domainModel: DomainModel) {
    guard let model = domainModel as? TransactionDomainModel else {
      return nil
    }
    self.init()
  }
}
