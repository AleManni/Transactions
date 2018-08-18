//
//  MainDatabase.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import RealmSwift

/// Tuple used for defining a desired sort property and direction when fetching objects.
typealias RealmSortDefinition = (sortProperty: String, sortAscending: Bool)

class MainDatabase: DataSource {
  func write(_ object: Object, shouldUpdateIfExists: Bool) {
    autoreleasepool {
      do {
        let realm = try Realm()

        try realm.write {
          realm.add(object, update: shouldUpdateIfExists)
        }
      } catch let exception {
        debugLog("[RealmManager] Failed to write with error: \(exception.localizedDescription)")
      }
    }
  }

  func write(_ objects: [Object], shouldUpdateIfExists: Bool) {
    autoreleasepool {
      do {
        let realm = try Realm()

        try realm.write {
          realm.add(objects, update: shouldUpdateIfExists)
        }
      } catch let exception {
        debugLog("[RealmManager] Failed to write with error: \(exception.localizedDescription)")
      }
    }
  }

  func delete<Element: Object, KeyType>(ofType type: Element.Type, forPrimaryKey key: KeyType) {
    autoreleasepool {
      do {
        let realm = try Realm()

        guard let obj = realm.object(ofType: type, forPrimaryKey: key) else {
          return
        }
        try realm.write {
          realm.delete(obj)
        }
      } catch let exception {
        debugLog("[RealmManager] Failed to delete with error: \(exception.localizedDescription)")
      }
    }
  }

  func delete(_ objects: [Object]) {
    autoreleasepool {
      do {
        let realm = try Realm()

        try realm.write {
          realm.delete(objects)
        }
      } catch let exception {
        debugLog("[RealmManager] Failed to delete with error: \(exception.localizedDescription)")
      }
    }
  }

  func delete<Element: Object, KeyType>(ofType type: Element.Type, forPrimaryKeys keys: [KeyType]) {
    autoreleasepool {
      do {
        let realm = try Realm()

        for key in keys {
          guard let object = realm.object(ofType: type, forPrimaryKey: key) else {
            continue
          }
          try realm.write {
            realm.delete(object)
          }
        }
      } catch let exception {
        debugLog("[RealmManager] Failed to delete with error: \(exception.localizedDescription)")
      }
    }
  }

  func deleteObjects<T: Object>(ofType type: T.Type) {
    autoreleasepool {
      do {
        let realm = try Realm()
        let objects = realm.objects(type)
        try realm.write {
          realm.delete(objects)
        }
      } catch let exception {
        debugLog("[RealmManager] Failed to delete with error: \(exception.localizedDescription)")
      }
    }
  }

  func objects<T: Object>(ofType type: T.Type, sortDefinition: RealmSortDefinition? = nil) -> [T] {
    var objects: [T] = []

    autoreleasepool {
      do {
        let realm   = try Realm()
        var results = realm.objects(type)

        if let sortDefinition = sortDefinition {
          results = results.sorted(byKeyPath: sortDefinition.sortProperty, ascending: sortDefinition.sortAscending)
        }
        objects = Array(results)
      } catch let exception {
        debugLog("[RealmManager] Failed to retrieve objects with error: \(exception.localizedDescription)")
      }
    }
    return objects
  }

  func object<T: Object, K>(ofType type: T.Type, primaryKey: K) -> T? {
    var object: T? = nil

    autoreleasepool {
      do {
        let realm = try Realm()

        object = realm.object(ofType: type, forPrimaryKey: primaryKey)
      } catch let exception {
        debugLog("[RealmManager] Failed to retrieve object with error: \(exception.localizedDescription)")
      }
    }
    return object
  }
}
