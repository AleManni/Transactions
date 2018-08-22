//
//  DefaultNetworkClient.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

final class DefaultNetworkClient: NetworkClient {

  var configuration: URLSessionConfiguration = URLSessionConfiguration.default

  private lazy var session: URLSession = {
    let configuration = self.configuration
    let session = URLSession(configuration: configuration)
    return session
  }()

  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void) {
    let task = session.dataTask(with: request, completionHandler: { (data, _, error) in
      if let error = error as NSError? {
        completion(.failure(error))
        return
      }
      guard let responseData = data else {
        completion(.success(nil))
        return
      }
        completion(.success(responseData))
    })
    task.resume()
  }
}
