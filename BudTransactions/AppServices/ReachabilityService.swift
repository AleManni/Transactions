//
//  ReachabilityService.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit
import Reachability

final class ReachabilityService: AppService, ApplicationService {

  lazy var shared: Reachability? = {
    if let reachability = Reachability() {
      return reachability
    } else {
      return nil
    }
  }()

  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
    do {
      try shared?.startNotifier()
    } catch {
      debugLog("It is not possible to start the reachability agent: \(self)")
    }
    return true
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    do {
      try shared?.startNotifier()
    } catch {
      debugLog("It is not possible to start the reachability agent: \(self)")
    }
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
      shared?.stopNotifier()
  }

  func applicationWillTerminate(_ application: UIApplication) {
      shared?.stopNotifier()
  }
}
