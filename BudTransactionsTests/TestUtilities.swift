//
//  TestUtilities.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation


class TestUtilities {

  static func loadJSON(_ fileName: String) -> Data? {
    guard let path = Bundle(for: TestUtilities.self).path(forResource: fileName, ofType: "json") else {
      return nil
    }
    return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) 
  }

  static func prettyPrint(with json: [String: Any]) -> String {
    let data = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
    let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
    return (string ?? "Invalid json format") as String
  }
}
