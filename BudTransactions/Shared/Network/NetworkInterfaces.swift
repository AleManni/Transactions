//
//  NetworkInterfaces.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

/**
 Provides the abstract layer interfacing with the concrete network client class (URLSession/Alomofire, etc)
 */
protocol Network {
  init(networkClient: NetworkClient, configurator: NetworkConfigurator)
  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void)
}

protocol NetworkConfigurator {
  /**
   Provides the environment properties for a network object
   - configuration: A URLSessionConfiguration
   */
  var configurationForCurrentEnvironment: URLSessionConfiguration { get }
}

/**
 Provides the concrete framework to handle network requests
 */
protocol NetworkClient {
  var configuration: URLSessionConfiguration { get set }
  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void)
}

