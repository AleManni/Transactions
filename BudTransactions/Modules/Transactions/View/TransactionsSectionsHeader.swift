//
//  TransactionsSectionsHeader.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

final class  TransactionsSectionsHeader: UITableViewHeaderFooterView {

  static let identifier = "transactionSectionHeaderIdentifier"

  // MARK: Constructors

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)

    if let label = textLabel {
      FontFormatter.format(label: label, textStyle: (.subtitleVerySmallBold, .purple))
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) is not implemented")
  }
}
