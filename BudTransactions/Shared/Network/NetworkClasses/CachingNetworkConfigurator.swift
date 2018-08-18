//
//  NetworkConfigurator.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

final class CachingNetworkConfigurator: NetworkConfigurator {

  lazy var configurationForCurrentEnvironment: URLSessionConfiguration = {
    let config = URLSessionConfiguration.default
    let memoryCapacity = 20 * 1024 * 1024
    let diskCapacity = 50 * 1024 * 1024
    let cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: nil)
    config.urlCache = cache
    config.requestCachePolicy = .returnCacheDataElseLoad
    return config
  }()
}
