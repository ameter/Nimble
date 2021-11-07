//
//  ReaderView.swift
//  UnsafePointers
//
//  Created by UnsafePointers on 11/5/21.
//

import SwiftUI
import Combine
import TextSourceKit

struct ReaderView: View {
  @ObservedObject var viewModel: ReaderViewModel
  
  var body: some View {
    Text(viewModel.currentWord)
  }
}

struct ReaderView_Previews: PreviewProvider {
  static var previews: some View {
    ReaderView(viewModel: .init(textSource: MockTextSource()))
      .previewAllColorSchemes
  }
}
