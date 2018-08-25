//
//  FontFormatter.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

import UIKit

public typealias TextStyle = (font: FontStyle, color: BudColour)

/**
 Font style convention for the Bud app.
 */
public enum FontStyle {
  case titleExtraLargeHeavy
  case titleVeryLargeHeavy
  case bodyLargeBold
  case bodyRegular
  case bodySmallRegular
  case bodySmallBold
  case bodyVerySmallBold
  case bodyVerySmallRegular
  case bodyExtraSmallBold
  case navigation
  case custom(UIFont)

  public var rawValue: UIFont {
    switch self {
    case .titleExtraLargeHeavy:
      return .systemFont(ofSize: 33.0, weight: .heavy)
    case .titleVeryLargeHeavy:
      return .systemFont(ofSize: 27.0, weight: .heavy)
    case .bodyLargeBold:
      return .systemFont(ofSize: 22.0, weight: .bold)
    case .bodyRegular:
      return .systemFont(ofSize: 18.0, weight: .regular)
    case .bodySmallRegular:
      return .systemFont(ofSize: 15.0, weight: .regular)
    case .bodySmallBold:
      return .systemFont(ofSize: 15.0, weight: .bold)
    case .bodyVerySmallBold:
      return .systemFont(ofSize: 13.0, weight: .bold)
    case .bodyVerySmallRegular:
      return .systemFont(ofSize: 13.0, weight: .regular)
    case .bodyExtraSmallBold:
      return .systemFont(ofSize: 11.0, weight: .bold)
    case .navigation:
      if #available(iOS 11, *) {
        return .systemFont(ofSize: 17.0, weight: .semibold)
      }
      return .systemFont(ofSize: 17.0, weight: .light)
    case .custom(let font):
      return font
    }
  }
}

/**
 `FontFormatter` is a structure that provide convenient function to style UI components.

 At the moment it supports:
 - UILabel
 - UIButton
 - UITextView
*/

public struct FontFormatter {
}

// MARK: UILabel

extension FontFormatter {
  /**
   Format a set of `UILabel` with a given style.

   - parameter labels:     Set of `UILabel` to style.
   - parameter textStyle:  The style to apply.
   */
  public static func format(labels: [UILabel], textStyle: TextStyle) {
    labels.forEach {
      format(label: $0, textStyle: textStyle)
    }
  }

  /**
   Format a given `UILabel` with a given style.

   - parameter label:      A `UILabel` to style.
   - parameter textStyle:  The style to apply.
   */
  public static func format(label: UILabel, textStyle: TextStyle) {
    label.textColor = textStyle.color.rawValue
    label.font = textStyle.font.rawValue
  }
}

// MARK: UIButton

extension FontFormatter {
  /**
   Format a set of `UIButton` with a given style.

   - parameter buttons:    Set of `UIButton` to style.
   - parameter textStyle:  The style to apply.
   - parameter state:      The control state to style. By default it uses `UIControlState.normal`.
   */
  public static func format(buttons: [UIButton], textStyle: TextStyle, for state: UIControlState = .normal) {
    buttons.forEach {
      format(button: $0, textStyle: textStyle, for: state)
    }
  }

  /**
   Format a given `UIButton` with a given style.

   - parameter button:     A `UIButton` to style.
   - parameter textStyle:  The style to apply.
   - parameter state:      The control state to style. By default it uses `UIControlState.normal`.
   */
  public static func format(button: UIButton, textStyle: TextStyle, for state: UIControlState = .normal) {
    button.setTitleColor(textStyle.color.rawValue, for: state)
    button.titleLabel?.font = textStyle.font.rawValue
  }
}

// MARK: UITextView

extension FontFormatter {
  /**
   Format a set of `UITextView` with a given style.

   - parameter textViews:  Set of `UITextView` to style.
   - parameter textStyle:  The style to apply.
   */
  public static func format(textViews: [UITextView], textStyle: TextStyle) {
    textViews.forEach {
      format(textView: $0, textStyle: textStyle)
    }
  }

  /**
   Format a given `UITextView` with a given style.

   - parameter textView:   A `UITextView` to style.
   - parameter textStyle:  The style to apply.
   */
  public static func format(textView: UITextView, textStyle: TextStyle) {
    textView.textColor = textStyle.color.rawValue
    textView.font = textStyle.font.rawValue
  }
}
