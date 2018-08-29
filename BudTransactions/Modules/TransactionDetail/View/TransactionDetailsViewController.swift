//
//  TransactionDetailsViewController.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

final class TransactionDetailsViewController: UIViewController {

  var presenter: TransactionDetailsPresenterInput?

  lazy var topView = TransactionDetailsTopView(frame: .zero)
  lazy var bottomView = TransactionDetailsBottomView(frame: .zero)

  init() {
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()
    view.addSubview(topView)
    view.addSubview(bottomView)
    setConstraints()
  }

  private func setConstraints() {
    topView.translatesAutoresizingMaskIntoConstraints = false
    bottomView.translatesAutoresizingMaskIntoConstraints = false

    topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    bottomView.heightAnchor.constraint(equalToConstant: 120).isActive = true

  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter?.updateView()
  }
}

extension TransactionDetailsViewController: TransactionDetailsViewInterface {

  func showTransaction(_ transaction: TransactionDetailsRepresentable) {
    self.title = transaction.dateString
    self.topView.populateView(representable: transaction)
    self.bottomView.populateView(representable: transaction)
  }
}
