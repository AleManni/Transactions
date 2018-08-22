//
//  TransactionsModuleFactory.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

extension ModulesFactory {

  func buildTransactionsView(router: NavigationService) -> TransactionsViewController {
    let view = TransactionsViewController()
    let interactor = TransactionsInteractor(repository: repositories.transactionsRepository)
    let presenter = TransactionsPresenter()
    view.presenter = presenter
    presenter.interactor = interactor
    interactor.output = presenter
    presenter.view = view
    presenter.router = router
    return view
  }
}
