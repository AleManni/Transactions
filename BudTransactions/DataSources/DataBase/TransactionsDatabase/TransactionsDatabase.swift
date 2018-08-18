//
//  TransactionsDatabase.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

import RealmSwift
/*
final class TransactionsDatabase: MainDatabase {
  func save(transaction: DomainModel) {
    guard let object = RecentSearch(domainModel: recentSearch) else {
      return
    }
    write(object, shouldUpdateIfExists: true)
  }

  func getRecentSearches(sortDefinition: RealmSortDefinition? = nil, limit: Int = 0) -> [RecentSearchDomainModel] {
    let dbModels = objects(ofType: RecentSearch.self, sortDefinition: sortDefinition)
    let safeLimit = min(limit, dbModels.count)

    return dbModels[0..<safeLimit].compactMap { buildRecentSearchDomainModel(databaseModel: $0) }
  }

  func deleteAllRecentSearches() {
    do {
      let realm = try Realm()
      let objects = realm.objects(RecentSearch.self)

      try realm.write {
        realm.delete(objects)
      }
    } catch let exception {
      CSDebug("[RecentSearchMainDatabase] Failed to delete with exception: \(exception.localizedDescription)")
    }
  }
}
 */

