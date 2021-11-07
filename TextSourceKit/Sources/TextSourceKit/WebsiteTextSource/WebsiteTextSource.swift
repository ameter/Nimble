//
// File.swift
// 
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0

import Foundation
#if !os(watchOS)
import WebKit

public struct WebsiteTextSource: TextSource {
  
  public var words: [String] = []
  
  public init(_ url: URL) async throws {
    //    let (data, _) = try await URLSession.shared.data(from: url)
    let request = URLRequest(url: url)
    let (attributedString, _) = try await NSAttributedString.fromHTML(request: request, options: [
      .documentType: NSAttributedString.DocumentType.html,
      .characterEncoding: String.Encoding.utf8.rawValue
    ])
    
    words = attributedString
      .string
      .components(separatedBy: .whitespacesAndNewlines)
      .filter { !$0.isEmpty }
  }
  
  // TODO: Create an alternative potentially leveraging an opensource Reader mode solution
  init() { }
}

#else
import UIKit

public struct WebsiteTextSource: TextSource {
  
  public var words: [String] = []
  
  public init(_ url: URL) async throws {
    let (data, _) = try await URLSession.shared.data(from: url)

    let attributedString = try NSAttributedString(
      data: data,
      options:
        [
          .documentType: NSAttributedString.DocumentType.html,
          .characterEncoding: String.Encoding.utf8.rawValue
        ],
      documentAttributes: nil
    )
    
    words = attributedString
      .string
      .components(separatedBy: .whitespacesAndNewlines)
      .filter { !$0.isEmpty }
  }
  
  // TODO: Create an alternative potentially leveraging an opensource Reader mode solution
  init() { }
}

#endif
