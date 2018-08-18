//
//  RealmManager.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import RealmSwift

/**
 `RealmManager` is a class that manage the different databases used by the app.
 Due to the sensitivity of the data, it sets up the following 64 BYTES ENCRYPTED database:
 - Default
 */
final class RealmManager: NSObject {
  private let migrations: [DatabaseMigration] = []

  func setDefaultRealm() {
    if let appName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String,
      let key = RealmManager.randomData() {

      var encryptionConfig = Realm.Configuration(encryptionKey: key, schemaVersion: 01, migrationBlock: { migration, oldSchemaVersion in
        // Realm will automatically detect new properties and removed properties
        // And will update the schema on disk automatically
        self.migrations.forEach { $0.perform(migration: migration, oldSchemaVersion: oldSchemaVersion) }
      })
      // Use the default directory, but replace the filename with the app name
      encryptionConfig.fileURL = encryptionConfig.fileURL!.deletingLastPathComponent().appendingPathComponent("\(appName).realm")

      if let fileUrl = encryptionConfig.fileURL {
        debugLog("[RealmManager] Database path is: \(fileUrl)")
      }
      Realm.Configuration.defaultConfiguration = encryptionConfig
    }
  }

  private static func randomData() -> Data? {
    var keyData = Data(count: 64)
    let result = keyData.withUnsafeMutableBytes {
      SecRandomCopyBytes(kSecRandomDefault, 64, $0)
    }
    if result == errSecSuccess {
      return keyData
    } else {
      debugLog("Realm: problem generating random key")
      return nil
    }
  }

}
