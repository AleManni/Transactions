//
//  PlaceholderView.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

/**
 This class provides a placeholder when there are not elements to be displayed on screen.
 It needs to be initilised using the provided build function
 */
final class PlaceHolderView: UIView {

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.numberOfLines = 0
    FontFormatter.format(label: label, textStyle: (.titleVeryLargeHeavy, .navyBlue))
    return label
  }()

  private lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.numberOfLines = 0
    FontFormatter.format(label: label, textStyle: (.bodyVerySmallRegular, .navyBlue))
    return label
  }()

  // MARK: Constructors

  override public init(frame: CGRect) {
    fatalError("This class accepts only the initializer (title: String, subtitle: String)")
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(title: String, subtitle: String) {
    super.init(frame: .zero)
    self.titleLabel.text = title
    self.subtitleLabel.text = subtitle
    setSubviews()
    setConstraints()
  }

  private func setSubviews() {
    backgroundColor = .white

    addSubview(titleLabel)
    addSubview(subtitleLabel)
  }

  private func setConstraints() {
    let kMargin: CGFloat = 16

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: kMargin).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -kMargin).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -kMargin).isActive = true

    subtitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: kMargin).isActive = true
    subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -kMargin).isActive = true
    subtitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -kMargin).isActive = true
  }

  // MARK: Content setter
  func setContent(title: String, subtitle: String, ctaTitle: String? = nil) {
    titleLabel.text = title
    subtitleLabel.text = subtitle
  }
}
