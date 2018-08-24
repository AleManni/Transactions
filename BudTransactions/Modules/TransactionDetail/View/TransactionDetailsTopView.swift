//
//  TransactionDetailsTopView.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

class TransactionDetailsTopView: UIView {

  private var placeholder = UIImage(named: "ic_placeholder")

  lazy var productImage: UIImageView = {
    let view =  UIImageView(image: placeholder)
    view.contentMode = .scaleAspectFit
    return view
  }()

  lazy var productNameLabel: UILabel = {
    let label = UILabel()
    FontFormatter.format(label: label, textStyle: (font: .bodySmallRegular, color: .navyBlue))
    return label
  }()

  lazy var amountLabel: UILabel = {
    let label = UILabel()
    FontFormatter.format(label: label, textStyle: (font: .largeBold, color: .navyBlue))
    label.setContentHuggingPriority(.defaultHigh, for: .vertical)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(productImage)
    addSubview(productNameLabel)
    addSubview(amountLabel)
    setConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setConstraints() {
    productImage.translatesAutoresizingMaskIntoConstraints = false
    productNameLabel.translatesAutoresizingMaskIntoConstraints = false
    amountLabel.translatesAutoresizingMaskIntoConstraints = false

    productImage.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    productImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26).isActive = true
    productImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    productImage.widthAnchor.constraint(equalToConstant: 40).isActive = true

    productNameLabel.centerYAnchor.constraint(equalTo: productImage.centerYAnchor).isActive = true
    productNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8).isActive = true
    productNameLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -16).isActive = true

    amountLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true

  }

  func populateView(representable: TransactionDetailsRepresentable) {
    productNameLabel.text = representable.productName
    productImage.setImageWithURLString(representable.productURLString, placeholder: placeholder)
    amountLabel.text = representable.amount
  }
}
