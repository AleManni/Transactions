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

  var presenter: TransactionsPresenterInput?

  lazy var tableView: TransactionsTableView = {
    let placeholder = PlaceHolderView(title: "No transactions",
                                      subtitle: "It looks like you don't have any transactions for the current period")
    let table = TransactionsTableView(placeholder: placeholder, style: .plain)
    table.refreshDelegate = self
    table.actionDelegate = self
    return table
  }()

  fileprivate lazy var activityIndicator: UIActivityIndicatorView = {
    return UIActivityIndicatorView(activityIndicatorStyle: .gray)
  }()

  lazy var errorBanner = ErrorBannerView(frame: .zero)

  var errorBannerTopConstraint: NSLayoutConstraint?

  private let errorBannerHeight: CGFloat = 40

  private var errorBannerOffset: CGFloat?

  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Transactions"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    view.accessibilityIdentifier = "transactionsListRootView"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()
    view.addSubview(tableView)
    view.addSubview(errorBanner)
    view.addSubview(activityIndicator)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    errorBanner.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false

    errorBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    errorBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    errorBanner.heightAnchor.constraint(equalToConstant: errorBannerHeight).isActive = true
    errorBannerTopConstraint = errorBanner.topAnchor.constraint(equalTo: view.topAnchor)
    errorBannerTopConstraint?.constant = errorBannerOffset ?? -errorBannerHeight
    errorBannerTopConstraint?.isActive = true

    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: errorBanner.bottomAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter?.updateView()
  }
}
extension TransactionsViewController: TransactionsViewInterface {

  func showTransactions(transactions: TransactionsListRepresentable) {
    self.tableView.representableList = transactions
  }

  func isLoading(_ isLoading: Bool) {
    isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
  }

  func displayWarning(_ warning: String?) {
    errorBannerOffset = warning != nil ? 0 : -errorBannerHeight
    errorBanner.setWarning(text: warning)
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
      self.errorBannerTopConstraint?.constant = self.errorBannerOffset ?? 0
      self.view.layoutIfNeeded()
    }, completion: nil)
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

extension TransactionsViewController: ReachabilityResponder {
  func networkChangedStatus(isAvailable: Bool, info: String?) {
    if isAvailable {
      presenter?.updateView()
    } else {
      presenter?.viewDidReceiveReachabilityWarning(info)
    }
  }
}
