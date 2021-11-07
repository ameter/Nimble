//
// View+PreviewAllColorSchemes.swift
// UnsafePointers
//
// Created by UnsafePointers on 11/6/21.
// License: Apache 2.0
  

import SwiftUI

extension View {
  var previewAllColorSchemes: some View {
    ForEach(
      ColorScheme.allCases,
      id: \.self,
      content: preferredColorScheme
    )
  }
}
