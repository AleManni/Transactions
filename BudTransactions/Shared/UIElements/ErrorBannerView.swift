//
//  ErrorBannerView.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

/**
 This class provides a warning/error banner to be displayed as a non-removable element of the view
 */
final class ErrorBannerView: UIView {

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.numberOfLines = 0
    FontFormatter.format(label: label, textStyle: (.bodyVerySmallBold, .white))
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  private func setupView() {
    backgroundColor = BudColour.red.rawValue
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setWarning(text: String?) {
    titleLabel.text = text
  }
}
