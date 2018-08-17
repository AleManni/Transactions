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
    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    UINavigationBar.appearance().isTranslucent = true
    UINavigationBar.appearance().shadowImage = UIImage()
  }

  fileprivate func setupSearchBar() {
    if #available(iOS 11, *) {
      let textAttributes: [String: Any] = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
      let placeholderAttributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.foregroundColor: UIColor.white]
      let placeholderText = "Search"

      UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = textAttributes
      UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                                                                                        attributes: placeholderAttributes)
    }
  }
}

// MARK: UIBarButtonItem

extension AppearanceService {
  fileprivate func setupBarButtonItem() {
    let attributes = [
      NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14.0, weight: .light)
    ]

    UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).setTitleTextAttributes(attributes, for: .normal)
  }
}
