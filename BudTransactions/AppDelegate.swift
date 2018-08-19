//
//  AppDelegate.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  private var services: [ApplicationService] = [
    NetworkService.safeSession,
    NetworkService.cachedSession,
    ReachabilityService.shared,
    AppearanceService(),
    RealmService(),
    AppCoordinatorService()
  ]

  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
    var result = true

    services.forEach {
      if let res = $0.application?(application, willFinishLaunchingWithOptions: launchOptions), !res {
        result = false
      }
    }
    return result
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
    var result = true

    services.forEach {
      if let res = $0.application?(application, didFinishLaunchingWithOptions: launchOptions), !res {
        result = false
      }
    }
    return result
  }

  func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
    services.forEach {
      $0.applicationDidReceiveMemoryWarning?(application)
    }
  }

  func applicationWillResignActive(_ application: UIApplication) {
    services.forEach {
      $0.applicationWillResignActive?(application)
    }
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    services.forEach {
      $0.applicationDidEnterBackground?(application)
    }
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    services.forEach {
      $0.applicationWillEnterForeground?(application)
    }
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    services.forEach {
      $0.applicationDidBecomeActive?(application)
    }
  }

  func applicationWillTerminate(_ application: UIApplication) {
    services.forEach {
      $0.applicationWillTerminate?(application)
    }
  }
}
