//
// TextSourceSelection.swift
// Nimble
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import SwiftUI

struct TextSourceSelection: Identifiable, Equatable {
  let id = UUID()
  let name: String
  
  @ViewBuilder func childView(_ textModel: TextModel) -> some View {
    switch self {
    case .pdf: PDFSelectionChildView(textModel: textModel)
    default: EmptyView()
    }
  }
}

extension TextSourceSelection {
  static let pdf: Self = .init(name: "PDF")
  
  static let allOptions: [TextSourceSelection] = [
    .pdf
    //    "Copy and Paste",
    //    "Website",
    //    "RSS Feed",
    //    ".epub"
  ]
}
