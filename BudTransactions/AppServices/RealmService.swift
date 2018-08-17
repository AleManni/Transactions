//
//  AppearanceService.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import UIKit

/**
 `RealmService` is an app service that takes care of managing the Realm database.
 */
final class RealmService: AppService, ApplicationService {
  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    RealmManager().setDefaultRealm()

    return true
  }
}
