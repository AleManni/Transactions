//
//  NavigationService.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

/**
 This class operates as a central Router for the VIPER module.
 Individual extensions conforms to the Router protocols of the different modules.
 */
final class NavigationService {

  let factory: ModulesFactory

  lazy var navigationController: UINavigationController = {
    return UINavigationController(nibName: nil, bundle: nil)
  }()

  private var modalNavigationControllers = [UINavigationController]()

  fileprivate var presenter: UINavigationController? {
    return modalNavigationControllers.last ?? navigationController
  }

  public var currentViewController: UIViewController {
    return presenter?.visibleViewController ?? UIViewController()
  }

  public var isCurrentVCPresentedModally: Bool {
    guard let lastModal = modalNavigationControllers.last,
      let rootVC = lastModal.viewControllers.first else {
        return false
    }
    return currentViewController === rootVC
  }

  lazy var window: UIWindow = {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate // swiftlint:disable:this force_cast

    if let window = appDelegate.window {
      return window
    } else {
      let window = UIWindow(frame: UIScreen.main.bounds)

      appDelegate.window = window
      appDelegate.window?.makeKeyAndVisible()

      return window
    }
  }()

  // MARK: Initialisation
  init(viewControllersFactory: ModulesFactory) {
    self.factory = viewControllersFactory
  }

  func setInitialView() {
    window.rootViewController = navigationController
    showTransactionNavigation()
  }

  // MARK: INTERNAL FUNCTIONS
  // MARK: Private utilities
  func showController(_ controller: UIViewController) {
    presenter?.pushViewController(controller, animated: true)
    controller.loadViewIfNeeded()
  }

  private func presentController(_ controller: UIViewController) {
    presenter?.present(controller, animated: true, completion: nil)
  }

  func backToRoot() {
    presenter?.popToRootViewController(animated: true)
  }
}
