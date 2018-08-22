//
//  UIImageViewExtensions.swift
//  BudTransactions
//
//  Created by Alessandro Manni on 20/08/2018.
//  Copyright © 2018 Alessandro Manni. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

  func setImageWithURLString(_ string: String, placeholder: UIImage) {
    self.image = placeholder
    ImageDownloader.shared.downloadImage(string, completion: { image in
      guard let image = image else {
        return
      }
      self.image = image
    })
  }
}
