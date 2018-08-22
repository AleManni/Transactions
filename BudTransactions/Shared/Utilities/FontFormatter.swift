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
 Font style convention for the CrowdScores app.
 */
public enum FontStyle {
  case titleExtraLargeHeavy
  case titleVeryLargeHeavy
  case titleLargeBold
  case caption
  case captionLarge
  case bodyLargeRegular
  case bodyLargeLight
  case bodyRegular
  case bodyHeavy
  case bodySmallRegular
  case bodyVerySmallBold
  case bodyVerySmallSemiBold
  case bodyVerySmallRegular
  case bodyVerySmallMedium
  case footnoteRegular
  case subheadRegular
  case headlineSemiBold
  case linkSmallRegular
  case linkSmallBold
  case linkRegular
  case linkLargeRegular
  case subtitleSemibold
  case subtitleBold
  case subtitleMedium
  case subtitleSmallSemibold
  case subtitleSmallRegular
  case subtitleVerySmallRegular
  case subtitleVerySmallMedium
  case subtitleVerySmallSemibold
  case subtitleVerySmallBold
  case subtitleSmallMedium
  case buttonLargeBold
  case navigation
  case custom(UIFont)

  public var rawValue: UIFont {
    switch self {
    case .titleExtraLargeHeavy:
      return .systemFont(ofSize: 33.0, weight: .heavy)
    case .titleVeryLargeHeavy:
      return .systemFont(ofSize: 27.0, weight: .heavy)
    case .titleLargeBold:
      return .systemFont(ofSize: 22.0, weight: .bold)
    case .caption:
      return .systemFont(ofSize: 15.0, weight: .heavy)
    case .captionLarge:
      return .systemFont(ofSize: 20.0, weight: .heavy)
    case .bodyLargeRegular:
      return .systemFont(ofSize: 20.0, weight: .regular)
    case .bodyLargeLight:
      return .systemFont(ofSize: 20.0, weight: .light)
    case .bodySmallRegular:
      return .systemFont(ofSize: 15.0, weight: .regular)
    case .bodyRegular:
      return .systemFont(ofSize: 17.0, weight: .regular)
    case .bodyHeavy:
      return .systemFont(ofSize: 17.0, weight: .heavy)
    case .bodyVerySmallBold:
      return .systemFont(ofSize: 13.0, weight: .bold)
    case .bodyVerySmallSemiBold:
      return .systemFont(ofSize: 13.0, weight: .semibold)
    case .bodyVerySmallRegular:
      return .systemFont(ofSize: 13.0, weight: .regular)
    case .bodyVerySmallMedium:
      return .systemFont(ofSize: 13.0, weight: .medium)
    case .footnoteRegular:
      return .systemFont(ofSize: 13.0, weight: .regular)
    case .subheadRegular:
      return .systemFont(ofSize: 15.0, weight: .regular)
    case .headlineSemiBold:
      return .systemFont(ofSize: 17.0, weight: .semibold)
    case .linkSmallRegular:
      return .systemFont(ofSize: 13.0, weight: .regular)
    case .linkSmallBold:
      return .systemFont(ofSize: 13.0, weight: .bold)
    case .linkRegular:
      return .systemFont(ofSize: 15.0, weight: .regular)
    case .linkLargeRegular:
      return .systemFont(ofSize: 20.0, weight: .regular)
    case .subtitleSmallSemibold:
      return .systemFont(ofSize: 13.0, weight: .semibold)
    case .subtitleSemibold:
      return .systemFont(ofSize: 15.0, weight: .semibold)
    case .subtitleBold:
      return .systemFont(ofSize: 15.0, weight: .bold)
    case .subtitleMedium:
      return .systemFont(ofSize: 15.0, weight: .medium)
    case .subtitleSmallMedium:
      return .systemFont(ofSize: 13.0, weight: .medium)
    case .subtitleSmallRegular:
      return .systemFont(ofSize: 13.0, weight: .regular)
    case .subtitleVerySmallRegular:
      return .systemFont(ofSize: 11.0, weight: .regular)
    case .subtitleVerySmallMedium:
      return .systemFont(ofSize: 11.0, weight: .medium)
    case .subtitleVerySmallSemibold:
      return .systemFont(ofSize: 11.0, weight: .semibold)
    case .subtitleVerySmallBold:
      return .systemFont(ofSize: 11.0, weight: .bold)
    case .buttonLargeBold:
      return .systemFont(ofSize: 17.0, weight: .bold)
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

 Feel free to add support for any new component you need, even custom component if required.
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
