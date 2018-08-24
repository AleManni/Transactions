//
//  AppearanceService.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import UIKit

/**
 `AppearanceService` is an app service that manage all the app general appearance.
 */
final class AppearanceService: AppService, ApplicationService {
  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
    setupNavigationBar()
    application.statusBarStyle = .lightContent
    return true
  }
}

// MARK: Navigation Bar

extension AppearanceService {
  fileprivate func setupNavigationBar() {
    let titleColor = UIColor.white

    if #available(iOS 11.0, *) {
      UINavigationBar.appearance().titleTextAttributes = [
        NSAttributedStringKey.foregroundColor: titleColor
      ]
      UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: titleColor]
    } else {
      UINavigationBar.appearance().titleTextAttributes = [
        NSAttributedStringKey.foregroundColor: titleColor,
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17.0, weight: .light)
      ]
    }
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().barTintColor = BudColour.navyBlue.rawValue
    UINavigationBar.appearance().isTranslucent = false
    UINavigationBar.appearance().prefersLargeTitles = true
  }
}
