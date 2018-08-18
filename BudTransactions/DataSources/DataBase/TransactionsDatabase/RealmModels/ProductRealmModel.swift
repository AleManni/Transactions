//
//  ProductRealmModel.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import RealmSwift

final class ProductRealmModel: Object {
  @objc dynamic var id: Int = -1
   @objc dynamic var name: String = ""
  @objc dynamic var iconURLString: String = ""

  convenience init(id: Int, name: String, iconURLString: String) {
    self.init()
    self.id = id
    self.name = name
    self.iconURLString = iconURLString
  }

  override class func primaryKey() -> String? {
    return "id"
  }
}

extension ProductRealmModel: DatabaseModel {
  convenience init?(domainModel: DomainModel) {
    guard let model = domainModel as? TransactionDomainModel else {
      return nil
    }
    self.init()
  }
}
