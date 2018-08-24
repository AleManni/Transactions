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

    guard let appName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String else {
      assertionFailure("Realm database location not found")
      return
    }

    guard let encryptionKey = getKey() as Data? else {
      assertionFailure("Realm could not generate encryption key")
      return
    }

    var encryptionConfig = Realm.Configuration(encryptionKey: encryptionKey, schemaVersion: 01, migrationBlock: { migration, oldSchemaVersion in
      self.migrations.forEach { $0.perform(migration: migration, oldSchemaVersion: oldSchemaVersion) }
    })

    encryptionConfig.fileURL = encryptionConfig.fileURL!.deletingLastPathComponent().appendingPathComponent("\(appName).realm")

    if let fileUrl = encryptionConfig.fileURL {
      debugLog("[RealmManager] Database path is: \(fileUrl)")
    }
    Realm.Configuration.defaultConfiguration = encryptionConfig
  }

  func setTestRealm(as inMemoryIdentifier: String) {
    let testConfiguration = Realm.Configuration(fileURL: nil,
                                                inMemoryIdentifier: inMemoryIdentifier,
                                                syncConfiguration: nil,
                                                encryptionKey: nil,
                                                readOnly: false,
                                                schemaVersion: 01,
                                                migrationBlock: nil,
                                                deleteRealmIfMigrationNeeded: false,
                                                shouldCompactOnLaunch: nil,
                                                objectTypes: nil)
    Realm.Configuration.defaultConfiguration = testConfiguration
  }
}

/*
 64 bit encryption key generation and retrival from Realm official documentation:
 https://github.com/realm/realm-cocoa/blob/master/examples/ios/swift/Encryption/ViewController.swift
 */
extension RealmManager {

  func getKey() -> NSData? {
    let keychainIdentifier = BudKeyChain.realmKey.rawValue
    let keychainIdentifierData = keychainIdentifier.data(using: String.Encoding.utf8, allowLossyConversion: false)!

    // First check in the keychain for an existing key
    var query: [NSString: AnyObject] = [
      kSecClass: kSecClassKey,
      kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
      kSecAttrKeySizeInBits: 512 as AnyObject,
      kSecReturnData: true as AnyObject
    ]

    // To avoid Swift optimization bug, should use withUnsafeMutablePointer() function to retrieve the keychain item
    var dataTypeRef: AnyObject?
    var status = withUnsafeMutablePointer(to: &dataTypeRef) { SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0)) }
    if status == errSecSuccess,
      let data = dataTypeRef as? NSData {
      return data
    }

    // No pre-existing key from this application, so generate a new one
    let keyData = NSMutableData(length: 64)!
    let result = SecRandomCopyBytes(kSecRandomDefault, 64, keyData.mutableBytes.bindMemory(to: UInt8.self, capacity: 64))
    assert(result == 0, "Failed to get random bytes")

    // Store the key in the keychain
    query = [
      kSecClass: kSecClassKey,
      kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
      kSecAttrKeySizeInBits: 512 as AnyObject,
      kSecValueData: keyData
    ]

    status = SecItemAdd(query as CFDictionary, nil)
    assert(status == errSecSuccess, "Failed to insert the new key in the keychain")

    return keyData
  }
}
