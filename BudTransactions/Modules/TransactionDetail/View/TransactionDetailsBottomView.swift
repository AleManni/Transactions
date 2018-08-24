//
//  TransactionDetailsBottomView.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 22/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

final class TransactionDetailsBottomView: UIView {

  lazy var verticalBar: UIView = {
    return UIView(frame: .zero)
  }()

  lazy var iconImage: UIImageView = {
    let view =  UIImageView(image: UIImage(named: "ic_placeholder"))
    view.contentMode = .scaleAspectFit
    view.layer.cornerRadius = 5
    view.layer.masksToBounds = true
    return view
  }()

  lazy var categoryLabel: UILabel = {
    let label = UILabel()
    FontFormatter.format(label: label, textStyle: (font: .bodySmallBold, color: .navyBlue))
    label.setContentHuggingPriority(.defaultHigh, for: .vertical)
    return label
  }()

  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    FontFormatter.format(label: label, textStyle: (font: .bodyRegular, color: .navyBlue))
    label.setContentHuggingPriority(.defaultHigh, for: .vertical)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(verticalBar)
    addSubview(iconImage)
    addSubview(categoryLabel)
    addSubview(descriptionLabel)
    setConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setConstraints() {
    verticalBar.translatesAutoresizingMaskIntoConstraints = false
    iconImage.translatesAutoresizingMaskIntoConstraints = false
    categoryLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

    let spacer: CGFloat = 16
    let barWidth: CGFloat = 10
    let iconDimensions: CGFloat = 40

    verticalBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
    verticalBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    verticalBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    verticalBar.widthAnchor.constraint(equalToConstant: barWidth).isActive = true

    iconImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
    iconImage.leadingAnchor.constraint(equalTo: verticalBar.trailingAnchor, constant: spacer).isActive = true
    iconImage.heightAnchor.constraint(equalToConstant: iconDimensions).isActive = true
    iconImage.widthAnchor.constraint(equalToConstant: iconDimensions).isActive = true

    categoryLabel.topAnchor.constraint(equalTo: iconImage.topAnchor).isActive = true
    categoryLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: spacer).isActive = true
    categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacer).isActive = true

    descriptionLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: spacer).isActive = true
    descriptionLabel.leadingAnchor.constraint(equalTo: iconImage.leadingAnchor).isActive = true
    descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacer).isActive = true

  }

  func populateView(representable: TransactionDetailsRepresentable) {
    verticalBar.backgroundColor = representable.categoryColour
    iconImage.image = UIImage(named: representable.categoryIconName)
    categoryLabel.text = representable.categoryDescription
    descriptionLabel.text = representable.description
    FontFormatter.format(label: categoryLabel, textStyle: (font: .bodySmallBold, color: .custom(representable.categoryColour)))
    FontFormatter.format(label: descriptionLabel, textStyle: (font: .bodyRegular, color: .custom(representable.categoryColour)))
  }

}
