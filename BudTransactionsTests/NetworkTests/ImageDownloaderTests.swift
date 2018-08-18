//
//  ImageDownloaderTests.swift
//  BudTransactionsTests
//
//  Created by Alessandro Manni on 18/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import XCTest
@testable import BudTransactions

class ImageDownloaderTests: XCTestCase {

  let configurator = MockNetworkConfigurator()

  func testServiceFetchImage() {
    let network = MockImageNetworkClient(configuration: configurator.configurationForCurrentEnvironment)
    let netService = NetworkService(networkClient: network, configurator: configurator)
    let downloader = ImageDownloader(networkService: netService)
    let mockURLString = "www.test.com"

     let expect = expectation(description: "image fetched")

    downloader.downloadImage(mockURLString, completion: { image in
      expect.fulfill()
        XCTAssertNotNil(image)
    })

    wait(for: [expect], timeout: 2)
  }
}
