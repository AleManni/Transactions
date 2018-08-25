//
//  DatabaseMigration.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import RealmSwift

/**
  Define the interface for a database migration.

  The name of a database migration struct should follow the following pattern:

<RealmClassName>Migration<PropertyName(s)ToChange>_<appVersion>_<migrationNumber>_<date>.swift

  E.g.: CompetitionMigrationUserOrdering_4_4_140218
*/
protocol DatabaseMigration {
  func perform(migration: Migration, oldSchemaVersion: UInt64)
}
