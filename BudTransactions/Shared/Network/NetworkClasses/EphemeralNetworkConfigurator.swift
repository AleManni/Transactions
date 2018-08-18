//
//  EphemeralNetworkConfigurator.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

final class EphemeralNetworkConfigurator: NetworkConfigurator {

  lazy var configurationForCurrentEnvironment: URLSessionConfiguration = {
    let config = URLSessionConfiguration.ephemeral
    return config
  }()
}
