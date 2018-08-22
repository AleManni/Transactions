//
//  TransactionsViewController.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

final class TransactionsViewController: UIViewController {

  var presenter: TransactionsPresenter?

  lazy var tableView: TransactionsTableView = {
    let placeholder = PlaceHolderView(title: "No transactions",
                                      subtitle: "It looks like you don't have any transactions for the current period")
    let table = TransactionsTableView(placeholder: placeholder, style: .plain)
    table.refreshDelegate = self
    table.actionDelegate = self
    return table
  }()

  lazy var errorBanner = ErrorBannerView(frame: .zero)

  var errorBannerTopConstraint: NSLayoutConstraint?

  private let errorBannerHeight: CGFloat = 40

  private var errorBannerOffset: CGFloat {
    return warning != nil ? 0 : -errorBannerHeight
  }

  var warning: String? = nil {
    didSet {
      if warning != oldValue || (warning != nil && oldValue == nil) {
        errorBanner.setWarning(text: warning)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
          self.errorBannerTopConstraint?.constant = self.errorBannerOffset
          self.view.layoutIfNeeded()
        }, completion: nil)
      }
    }
  }

  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Transactions"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()
    view.addSubview(tableView)
    view.addSubview(errorBanner)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    errorBanner.translatesAutoresizingMaskIntoConstraints = false

    errorBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    errorBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    errorBanner.heightAnchor.constraint(equalToConstant: errorBannerHeight).isActive = true
    errorBannerTopConstraint = errorBanner.topAnchor.constraint(equalTo: view.topAnchor)
    errorBannerTopConstraint?.constant = errorBannerOffset
    errorBannerTopConstraint?.isActive = true

    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: errorBanner.bottomAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.updateView()
  }
}
extension TransactionsViewController: TransactionsViewInterface {

  func showTransactions(transactions: TransactionsListRepresentable, warning: String?) {
    self.warning = warning
    self.tableView.representableList = transactions
  }

  func showErrorDescription(_ description: String) {
    self.tableView.representableList = nil
    self.warning = description
  }
}

extension TransactionsViewController: TransactionsTableViewActionDelegate {
  func didTapOnTransaction(id: String) {
    presenter?.showDetailsForTransaction(id: id)
  }
}

extension TransactionsViewController: BaseTableViewRefreshDelegate {
  func didPullToRefresh() {
    presenter?.updateView()
  }
}
