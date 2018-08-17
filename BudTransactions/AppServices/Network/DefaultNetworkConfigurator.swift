//
//  NetworkConfigurator.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

class DefaultNetworkConfigurator: NetworkConfigurator {

  lazy var configurationForCurrentEnvironment: URLSessionConfiguration = {
    let config = URLSessionConfiguration.default
    //TODO: Configure cache
    return config
  }()
}
