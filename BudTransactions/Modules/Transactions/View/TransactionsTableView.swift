//
//  TransactionsTableView.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

protocol TransactionsTableViewActionDelegate: class {
  func didTapOnTransaction(id: String)
}

final class TransactionsTableView: BaseTableView {

  weak var actionDelegate: TransactionsTableViewActionDelegate?

  var representableList: TransactionsListRepresentable? {
    didSet {
      requiresPlaceholder = representableList == nil
      refreshController.endRefreshing()
      reloadData()
    }
  }

  override init(placeholder: PlaceHolderView?, style: UITableViewStyle) {
    super.init(placeholder: placeholder, style: style)
    rowHeight = 50
    register(TransactionsTableCell.self, forCellReuseIdentifier: TransactionsTableCell.identifier)
    register(TransactionsSectionsHeader.self, forHeaderFooterViewReuseIdentifier: TransactionsSectionsHeader.identifier)
    tableFooterView = UIView()
    self.dataSource = self
    self.delegate = self
    accessibilityIdentifier = "transactionsListTableView"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TransactionsTableView: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return representableList?.count ?? 0
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return representableList?[safe: section]?.transactions.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = dequeueReusableCell(withIdentifier: TransactionsTableCell.identifier) as? TransactionsTableCell,
      let representable = representableList?[safe: indexPath.section]?.transactions[safe: indexPath.row] else {
        return TransactionsTableCell(style: .default, reuseIdentifier: TransactionsTableCell.identifier)
    }
    cell.populate(with: representable)
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return representableList?[safe: section]?.title
  }

}

extension TransactionsTableView: UITableViewDelegate {

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TransactionsSectionsHeader.identifier) else {
      return TransactionsSectionsHeader(reuseIdentifier: TransactionsSectionsHeader.identifier)
    }
    return header
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let representable = representableList?[safe: indexPath.section]?.transactions[safe: indexPath.row] {
      actionDelegate?.didTapOnTransaction(id: representable.id)
    }
    deselectRow(at: indexPath, animated: true)
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
}
