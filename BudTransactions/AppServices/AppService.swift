//
//  AppService.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

/**
 `ApplicationService` is a simple protocol that implements `UIApplicationDelegate`.

 This allow us to create app services conform to `UIApplicationDelegate` and used by the AppDelegate to notify them of the different states of the app.
 */
protocol ApplicationService: UIApplicationDelegate {
}

/**
 `AppService` is a simple class used to manage an app service's logging and name.
 */
class AppService: NSObject {
  var serviceName: String {
    return String(describing: type(of: self))
  }
}
