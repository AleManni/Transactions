//
//  APIInterface.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation

protocol API {
  associatedtype Domain: Codable
  init(_ networkService: NetworkService?)
  var networkService: NetworkService { get set }
}

extension API {

  func getObject(request: APIRequest, completion: @escaping ((OperationResult<Domain>) -> Void)) {
    if let urlRequest = request.urlRequest.valid {
      networkService.handleRequest(urlRequest, completion: { networkCompletion in

        switch networkCompletion {
        case .success(let json):
          completion(self.mapToObject(json: json))
        case .failure(let error):
          completion(.failure(error))
        }
      })
    } else {
      completion(OperationResult<Domain>.failure(request.urlRequest.error))
    }
  }

  func mapToObject(json: Any?) -> OperationResult<Domain> {
    guard let jsonString = json as? String,
      let jsonData = jsonString.data(using: .utf8) else {
        return OperationResult.failure(APIErrors.incorrectDataType)
    }
    do {
      let object = try JSONDecoder().decode(Domain.self, from: jsonData)
      return OperationResult<Domain>.success(object)
    } catch let error {
      return .failure(APIErrors.deserializationError(error))
    }
  }

  func dateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssxxx"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }
}
