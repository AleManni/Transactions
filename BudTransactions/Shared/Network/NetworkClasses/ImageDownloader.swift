//
//  ImageDownloader.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

/**
 Utility class for downloading images
 Due to the non sensitive type of the images in this demo app, the shared singleton makes use of the cachedSession (CachingNetworkConfiguration) in order to minimise network usage.
 */
final class ImageDownloader {

  let networkService: Network

  let downloadQueue = DispatchQueue.global(qos: .userInteractive)

  static let shared = ImageDownloader(networkService: NetworkService.cachedSession)

  init(networkService: Network) {
    self.networkService = networkService
  }

  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void) {
    networkService.handleRequest(request, completion: { result in
      completion(result)
    })
  }

  func downloadImage(_ urlString: String, completion: @escaping (UIImage?) -> Void) {
    guard let url = URL(string: urlString) else {
      completion(nil)
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    downloadQueue.async { [weak self] in
      self?.handleRequest(request, completion: { result in
        switch result {
        case .success(let data):
          DispatchQueue.main.async {
            guard let data = data as? Data,
              let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
          }
        default:
          DispatchQueue.main.async {
            completion(nil)
          }
        }
      })
    }
  }
}
