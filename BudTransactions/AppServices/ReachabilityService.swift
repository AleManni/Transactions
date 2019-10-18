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

  static let shared = ReachabilityService()

  var isReachable: Bool {
    return reachability?.connection != Optional.none
  }

  lazy var reachability: Reachability? = {
    if let reachability = try? Reachability() {
      return reachability
    } else {
      return nil
    }
  }()

  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
    do {
      try reachability?.startNotifier()
    } catch {
      debugLog("It is not possible to start the reachability agent: \(self)")
    }
    return true
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    do {
      try reachability?.startNotifier()
    } catch {
      debugLog("It is not possible to start the reachability agent: \(self)")
    }
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
      reachability?.stopNotifier()
  }

  func applicationWillTerminate(_ application: UIApplication) {
      reachability?.stopNotifier()
  }
}
