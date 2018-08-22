//
//  BaseTableView.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

protocol BaseTableViewRefreshDelegate: class {
  func didPullToRefresh()
}

class BaseTableView: UITableView {
  let placeholder: PlaceHolderView?
  weak var refreshDelegate: BaseTableViewRefreshDelegate?

  lazy var refreshController: UIRefreshControl = {
    let control = UIRefreshControl()
    control.addTarget(self, action: #selector(refresh), for: .valueChanged)
    return control
  }()

  @objc func refresh() {
    refreshDelegate?.didPullToRefresh()
  }

  var requiresPlaceholder: Bool = true {
    didSet {
      if let placeholder = placeholder {
        if requiresPlaceholder {
          addSubview(placeholder)
          addSubview(refreshController)
          setPlaceholderConstraints()
          layoutIfNeeded()
        } else {
          placeholder.removeFromSuperview()
        }
      }
    }
  }

  init(placeholder: PlaceHolderView?, style: UITableViewStyle = .plain) {
    self.placeholder = placeholder
    super.init(frame: CGRect.zero, style: style)
    addSubview(refreshController)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setPlaceholderConstraints() {
    if let placeholderView = placeholder {
      placeholderView.translatesAutoresizingMaskIntoConstraints = false
      placeholderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
      placeholderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
      placeholderView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
      placeholderView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
      let width = placeholderView.widthAnchor.constraint(equalTo: widthAnchor)
      width.priority = .defaultHigh
      width.isActive = true

      let height = placeholderView.heightAnchor.constraint(equalTo: heightAnchor)
      height.priority = .defaultHigh
      height.isActive = true

    }
  }
}
