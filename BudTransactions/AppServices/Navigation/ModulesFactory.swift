//
//  ViewControllersFactory.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import UIKit
/**
 The ModulesFactory operates as a factory for its client (the NavigationService)
 The initialization method allows to inject a class conforming to BudRepositories that provides concrete repositories implementations to the ModulesFactory.
 Such class will provide the repositories used by the ModulesFactory implementation in order to build each Module.
 In this instance, TestRepositories is used to feed mock data during UI tests
 */

final class ModulesFactory {

  let repositories: BudRepositories

  init(repositories: BudRepositories) {
    self.repositories = repositories
  }
}
