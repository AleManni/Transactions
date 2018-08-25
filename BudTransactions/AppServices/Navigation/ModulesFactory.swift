//
//  ViewControllersFactory.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import UIKit
/**
 The ModulesFactory operates as a wireframe for its client (the NavigationService)
 The initialization method allows to inject a class conforming to BudRepositories that provides concrete repositories implementations to the ModulesFactory.
 Such class will provide the repositories used by the ModulesFactory implementation in order to build each Module.
 Upon implementing UI Tests, a class such as TestRepositories could be used to feed mock data to the app
 */

protocol BudRepositories {
  var transactionsRepository: TransactionsRepositoryInterface { get }
}

final class ProductionRepositories: BudRepositories {
  var transactionsRepository: TransactionsRepositoryInterface =
    TransactionsRepository(api: TransactionsAPI(NetworkService.safeSession),
                           database: TransactionsDatabase())
}

final class ModulesFactory {

  let repositories: BudRepositories

  init<T: BudRepositories>(repositories: T) {
    self.repositories = repositories
  }
}
