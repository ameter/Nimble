//
// MenuView.swift
// UnsafePointers
//
// Created by UnsafePointers on 11/6/21.
// License: Apache 2.0
  

import SwiftUI
import TextSourceKit

struct TextSourceWrapper: Identifiable {
  let id = UUID()
  let name: String
}

// This was just because I had to make it identifiable and was too lazy to change the exisiting `options` array in MenuViewModel
extension TextSourceWrapper: ExpressibleByStringLiteral {
  init(stringLiteral value: StringLiteralType) {
    self.init(name: value)
  }
}

class MenuViewModel: ObservableObject {
  let options: [TextSourceWrapper] = [
    "PDF",
    "Copy and Paste",
    "Website",
    "RSS Feed",
    ".epub"
  ]
}

struct MenuView: View {
  @ObservedObject var viewModel = MenuViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        List(viewModel.options) { option in
          NavigationLink(destination: EmptyView()) {
            Text(option.name)
          }
        }
        .listStyle(.insetGrouped)
      }
      .navigationTitle("Source Options")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
      MenuView()
        .previewAllColorSchemes
    }
}
