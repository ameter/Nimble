//
// MenuView.swift
// UnsafePointers
//
// Created by UnsafePointers on 11/6/21.
// License: Apache 2.0
  

import SwiftUI
import TextSourceKit

struct MenuView: View {
  @ObservedObject var viewModel: MenuViewModel
  
  init(_ textModel: TextModel) {
    self.viewModel = .init(textModel: textModel)
  }
  
  var body: some View {
    NavigationView {
      VStack {
        List(viewModel.options) { option in
          NavigationLink(destination: option.childView(viewModel.textModel)) {
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
      MenuView(TextModel(source: MockTextSource()))
        .previewAllColorSchemes
    }
}
