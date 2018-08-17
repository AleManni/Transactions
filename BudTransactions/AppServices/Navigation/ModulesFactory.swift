//
//  ViewControllersFactory.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import UIKit
/**
 The ModulesFactory defines the requirement for the Factory class.
 The initialization method requires the arg repositories to inject a class of type CrowdscoresRepositories.
 Such class will provide the repositories used by the ModulesFactory implementation in order to initialise each Module.
 Concrete classes such as TransactionRepository can be used to feed production VS mock data to the UI
 */

protocol BudRepositories {
  //  var TransactionRepository { get } // uncomment when ready
}

final class ProductionRepositories: BudRepositories {
  //TODO: Add here the Transaction Repo
}

final class ModulesFactory {

  let repositories: BudRepositories

  init<T: BudRepositories>(repositories: T) {
    self.repositories = repositories
  }
}
