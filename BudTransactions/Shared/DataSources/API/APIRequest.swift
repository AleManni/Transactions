//
//  APIRequest.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 16/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//


import Foundation

/**This struct provides an optional URLRequest to be used for network requests.
 ### Usage Example: ###
 ````
 let parameters: [RequestParameter] = [(RequestParametersType.fields("in-current-season"), ["true"])]
 let roundInSeasonRequest = APIRequest(endpoint: "teams", ids: [444], pathOptionalSuffix: "rounds", parameters: parameters)
 // let _ = roundInSeasonRequest.urlString // "https://mobile-dev-api.crowdscores.com/v2/teams/444/rounds?fields%5Bin-current-season%5D=true"
 // let _ = roundInSeasonRequest.request // The URLRequest
 ````
 */
struct APIRequest {
  let endpoint: String
  let ids: [Int]?
  let pathOptionalSuffix: String?
  let parameters: [RequestParameter]?
  let body: BodyType?
  let method: HTTPMethod
  let apiVersion: APIVersion
  var timeout: Double?

  init(endpoint: String, ids: [Int]?,
       pathOptionalSuffix: String? = nil,
       parameters: [RequestParameter]? = nil,
       body: BodyType? = nil,
       method: HTTPMethod = HTTPMethod.get,
       apiVersion: APIVersion = APIVersion.version2) {
    self.endpoint = endpoint
    self.ids = ids
    self.pathOptionalSuffix = pathOptionalSuffix
    self.parameters = parameters
    self.body = body
    self.method = method
    self.apiVersion = apiVersion
  }
}

extension APIRequest {

  var urlRequest: (valid: URLRequest?, error: Error?) {
    guard let urlString = urlString,
      let url = URL(string: urlString) else {
        return (nil, APIRequestError.missingURL)
    }
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    if let body = body, method == .post {
      do {
        switch body {
        case .json(let bodyDict):
          let jsonData = try JSONSerialization.data(withJSONObject: bodyDict)
          request.httpBody = jsonData
          request.addValue("application/vnd.api+json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        case .form(let bodyDict):
          let parameterArray = bodyDict.map { (arg) -> String in
            let (key, value) = arg
            return "\(key)=\(value.URLEncoded)"
          }
          request.httpBody = parameterArray.joined(separator: "&").data(using: String.Encoding.utf8)
          request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
      } catch let error {
        return(nil, APIRequestError.jsonError(error))
      }
    }
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    if let timeout = timeout {
      request.timeoutInterval = timeout
    }
    return (request, nil)
  }

  var urlString: String? {
    var components = URLComponents()
    components.scheme = "https"
    components.percentEncodedHost = URLComponents.budBase()
    components.path = path
    components.queryItems = queryItems
    components.percentEncodedQuery = components.percentEncodedQuery?
      .replacingOccurrences(of: "+", with: "%2B")
    return components.string
  }

  private var queryItems: [URLQueryItem]? {
    guard let parameters = parameters else {
      return nil
    }
    return parameters.compactMap {
      URLQueryItem(name: $0.0.string, value: $0.1.joined(separator: ","))
    }
  }

  private var path: String {
    let separator = "/"
    let idArr = ids ?? []
    let idString = idArr.compactMap {
      String($0)
      }.joined(separator: ",")

    return separator + [apiVersion.rawValue, endpoint, idString, pathOptionalSuffix]
      .compactMap { $0 }
      .joined(separator: separator)
  }
}

// MARK: Accessory enums and alias

typealias RequestParameter = (type: RequestParametersType, values: [String])

public enum APIVersion: String {
  case version1 = "v1"
  case version2 = "v2"
}

public enum RequestParametersType: Hashable {
  case filter(String)
  case limit
  case query
  case free(String)

  var string: String {
    switch self {
    case .filter(let string):
      return "filter[\(string)]"
    case .limit:
      return "limit"
    case .query:
      return "query"
    case .free(let string):
      return string
    }
  }
}

public enum HTTPMethod: String {
  case post = "POST"
  case put = "PUT"
  case get = "GET"
  case delete = "DELETE"
  case patch = "PATCH"
}

public enum BodyType {
  case json([String: Any])
  case form([String: String])
}

public enum APIRequestError: Error, CustomStringConvertible {
  case missingURL
  case jsonError(Error)

  public var description: String {
    switch self {
    case .missingURL:
      return "Not possible to generate url from the provided components"
    case .jsonError:
      return "Unexpected error while encoding provided body to JSON"
    }
  }

}

