//
//  CollectionExtensions.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

public extension Collection where Indices.Iterator.Element == Index {
  public subscript (safe index: Index) -> Iterator.Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
