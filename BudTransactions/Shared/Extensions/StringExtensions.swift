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

    //: ### Base64 encoding
    func base64Encoded() -> String? {
      if let data = self.data(using: .utf8) {
        return data.base64EncodedString()
      }
      return nil
    }

    //: ### Base64 decoding
    func base64Decoded() -> String? {
      if let data = Data(base64Encoded: self) {
        return String(data: data, encoding: .utf8)
      }
      return nil
    }
}
