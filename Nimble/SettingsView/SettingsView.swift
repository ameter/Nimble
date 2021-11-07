//
// SettingsView.swift
// Nimble
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import SwiftUI

struct SettingsView: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    Color.blue
    Button("Dismiss") {
      dismiss()
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
      .previewAllColorSchemes
  }
}
