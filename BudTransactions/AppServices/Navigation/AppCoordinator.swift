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

  lazy var navigationService: NavigationService? = {
    return NavigationService(viewControllersFactory: ModulesFactory(repositories: ProductionRepositories()))
  }()

  func performsStartUpOperations() {
    setObserver()
  }

  private func setObserver() {
    NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: nil)
  }

  // MARK: - Notifications handling

  @objc private func reachabilityChanged(note: Notification) {
    if let reachability = note.object as? Reachability {
      switch reachability.connection {
      case .none:
        // DO SOMETHING! - eg. send a Notification or delegate into the Navigation Service
        break
      default:
         // DO SOMETHING! - eg. send a Notification or delegate into the Navigation Service
        break
      }
    }
  }

  deinit {
    let notificationCenter = NotificationCenter.default
    notificationCenter.removeObserver(self)
  }
}
