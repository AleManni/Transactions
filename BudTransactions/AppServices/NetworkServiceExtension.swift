//
//  NetworkService.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

extension NetworkService {

  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    NetworkService.safeSession.configureService()
    NetworkService.cachedSession.configureService()
    return true
  }
}
