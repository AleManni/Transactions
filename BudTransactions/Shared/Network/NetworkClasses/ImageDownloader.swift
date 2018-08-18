//
//  ImageDownloader.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 17/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

final class ImageDownloader {

  let networkService: Network

  let downloadQueue = DispatchQueue.global(qos: .userInteractive)

  static let shared = ImageDownloader(networkService: NetworkService.cachedSession)


  init(networkService: Network) {
    self.networkService = networkService
  }

  func handleRequest(_ request: URLRequest, completion: @escaping (NetworkResult) -> Void) {
    assertionFailure("ImageDownloader is not able to handle APIRequests")
  }

  func downloadImage(_ urlString: String, completion:@escaping (UIImage?)->()) {
    guard let url = URL(string: urlString) else {
      completion(nil)
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    downloadQueue.async {
    self.handleRequest(request, completion: { result in
      switch result {
      case .success(let data):
        guard let data = data as? Data,
          let image = UIImage(data: data) else {
            DispatchQueue.main.async {
            completion(nil)
            }
            return
        }
        DispatchQueue.main.async {
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

let image = UIImage()
let data = UIImageJPEGRepresentation(image, 1)
