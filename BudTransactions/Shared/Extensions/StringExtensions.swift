//
//  StringExtensions.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

extension String {

  var URLEncoded: String {
    let unreservedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"
    let unreservedCharset = CharacterSet(charactersIn: unreservedChars)
    let encodedString = self.addingPercentEncoding(withAllowedCharacters: unreservedCharset)?
      .replacingOccurrences(of: " ", with: "+")
      .replacingOccurrences(of: " ", with: "+", options: [], range: nil)
    return encodedString ?? self
  }
}
