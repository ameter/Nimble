// Created by UnsafePointers on 11/6/21.
// License: Apache 2.0

import Foundation

public protocol TextSource {
  func fetch (index: Int, count: Int?) -> [String]
  var words: [String] { get }
}

extension TextSource {
    public func fetch (index: Int = 0, count: Int? = nil) -> [String] {
      guard index >= 0, index < words.count else { return [] }
      
      guard let count = count else {
          return Array(words[index...])
      }
      
      if index + count < words.count {
          return Array(words[index..<index+count])
      } else {
          return Array(words[index...])
      }
    }
}

#if !os(watchOS)
extension TextSource where Self == PDFTextSource {
  static func pdf(url: URL) throws -> Self {
    try .init(url)
  }
}
#endif
