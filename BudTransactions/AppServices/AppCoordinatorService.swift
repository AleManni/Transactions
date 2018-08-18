//
//  AppCoordinateService.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import UIKit

/**
 `DefaultAppCoordinatorService` is an app service that manage the app coordinator. See `DefaultAppCoordinator`.
 */
final class AppCoordinatorService: AppService, ApplicationService {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
    DefaultAppCoordinator.shared.performsStartUpOperations()
    return true
  }
}
