//
//  NetworkService.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

final class NetworkService: AppService, ApplicationService, Network {

  private var networkClient: NetworkClient
  private let configurator: NetworkConfigurator

  static let safeSession = NetworkService(networkClient: DefaultNetworkClient(),
                                          configurator: EphemeralNetworkConfigurator())

  static let cachedSession = NetworkService(networkClient: DefaultNetworkClient(),
                                     configurator: CachingNetworkConfigurator())

  required  init(networkClient: NetworkClient, configurator: NetworkConfigurator) {
    self.networkClient = networkClient
    self.configurator = configurator
  }

  func configureService() {
    networkClient.configuration = configurator.configurationForCurrentEnvironment
  }

  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void) {

    // Point of injection for auth headers, app common headers etc. Not used in this demo.

    networkClient.handleRequest(request, completion: { result in
      DispatchQueue.main.async {
      completion(result)
      }
    })
  }
}
