//
//  DefaultAppCoordinator.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import Reachability

/**
 NOTE: This class has responsibility over coordination between different modules and the UI navigation service
 */
@objc final class DefaultAppCoordinator: NSObject {
  @objc public static let shared = DefaultAppCoordinator()

  private var repositories: BudRepositories {
    #if TESTING
    return TestsRepositories()
    #else
    return ProductionRepositories()
    #endif
  }

  lazy var navigationService: NavigationService? = {
    return NavigationService(viewControllersFactory: ModulesFactory(repositories: repositories))
  }()

  func performsStartUpOperations() {
    setObserver()
    navigationService?.setInitialView()
  }

  private func setObserver() {
    NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: nil)
  }

  // MARK: - Notifications handling

  @objc private func reachabilityChanged(note: Notification) {
      if let controller = navigationService?.currentViewController as? ReachabilityResponder {
        switch ReachabilityService.shared.isReachable {
        case true:
        controller.networkChangedStatus(isAvailable: true, info: nil)
        case false:
          controller.networkChangedStatus(isAvailable: false, info: "Network not available!")
        }
    }
  }

  deinit {
    let notificationCenter = NotificationCenter.default
    notificationCenter.removeObserver(self)
  }
}
