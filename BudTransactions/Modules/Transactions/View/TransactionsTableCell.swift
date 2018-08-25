//
//  TransactionsTableCell.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

final class  TransactionsTableCell: UITableViewCell {

  static let identifier = "transactionTableCellIdentifier"

  private let kCategoryImageSize: CGFloat = 25

  private var itemId: String?

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    FontFormatter.format(label: label, textStyle: (font: .bodySmallRegular, color: .navyBlue))
    label.setContentHuggingPriority(.defaultHigh, for: .vertical)
    return label
  }()

  lazy var categoryImageView: UIImageView = {
    let view = UIImageView()
    view.contentMode = .scaleAspectFit
    view.layer.cornerRadius = 5
    view.layer.masksToBounds = true
    return view
  }()

  lazy var amountLabel: UILabel = {
    let label = UILabel()
    FontFormatter.format(label: label, textStyle: (font: .bodyRegular, color: .navyBlue))
    label.textAlignment = .center
    label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    return label
  }()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(categoryImageView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(amountLabel)
    setConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setConstraints() {

    categoryImageView.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    amountLabel.translatesAutoresizingMaskIntoConstraints = false

    let spacer: CGFloat = 16

    categoryImageView.widthAnchor.constraint(equalToConstant: kCategoryImageSize).isActive = true
    let categoryImageViewHeight = categoryImageView.heightAnchor.constraint(equalToConstant: kCategoryImageSize)
    categoryImageViewHeight.priority = .defaultHigh
    categoryImageViewHeight.isActive = true
    categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.5).isActive = true
    categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12.5).isActive = true
    categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacer).isActive = true

    titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: spacer).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -spacer).isActive = true

    amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacer).isActive = true
    amountLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    amountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }

  func populate(with representable: TransactionRepresentable) {
    categoryImageView.image = UIImage(named: representable.iconName)
    titleLabel.text = representable.title
    amountLabel.text = representable.amount
    itemId = representable.id
  }
}
