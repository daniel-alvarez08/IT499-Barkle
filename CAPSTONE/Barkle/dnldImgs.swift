//
//  dnldImgs.swift
//  Barkle
//

import Foundation
import UIKit

enum BarkleError: Error {
  case invalidUrlString
    case invalidData
}

class ImageDownloader {
  
  static func getImage(urlString: String) async throws -> UIImage {
    if let cachedImage = ImageCache.shared[urlString] {
      return cachedImage
    }
    guard let url = URL(string: urlString) else {
      throw BarkleError.invalidUrlString
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    guard let image = UIImage(data: data) else{
        throw BarkleError.invalidData
    }
    ImageCache.shared[urlString] = image
    return image
  }
}

class ImageCache: NSCache<NSString, UIImage> {
    static let shared = ImageCache()
  
    subscript(key: String) -> UIImage? {
        get {
            return object(forKey: NSString(string: key))
        }
        set {
            if let newValue = newValue {
                setObject(newValue, forKey: NSString(string: key))
            } else {
                removeObject(forKey: NSString(string: key))
            }
        }
    }
}
