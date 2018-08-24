//
//  TransactionDetailsModuleFactory.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

extension ModulesFactory {
  func buildTransactionsDetailsView(data: TransactionDomainModel) -> TransactionDetailsViewController {
    let interactor = TransactionDetailsInteractor(data: data)
    let presenter = TransactionDetailsPresenter()
    presenter.interactor = interactor
    interactor.output = presenter
    let view = TransactionDetailsViewController()
    presenter.view = view
    view.presenter = presenter
    return view
  }
}
