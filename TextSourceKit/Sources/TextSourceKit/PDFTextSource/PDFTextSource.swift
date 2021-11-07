//
// File.swift
// 
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import Foundation
#if !os(watchOS)
import PDFKit

enum TextSourceError: Error {
  case pdfNotFound
  case pdfNoContent
  case pdfPermissionError
}

public struct PDFTextSource: TextSource {
  
  // fetch(…) from default implementation
  
  public var words: [String] = []
  
  public init(_ url: URL) throws {
    defer { url.stopAccessingSecurityScopedResource() }
    guard url.startAccessingSecurityScopedResource() else {
      throw TextSourceError.pdfPermissionError
    }
    
    guard let pdf = PDFDocument.init(url: url) else {
      throw TextSourceError.pdfNotFound
    }
        
    if let string = pdf.string {
      let separators: CharacterSet = .whitespacesAndNewlines
      
      words = string.components(separatedBy: separators)
    } else {
      // TODO: Functionality to pull text from pdf image
      throw TextSourceError.pdfNoContent
    }
  }
}
#endif
