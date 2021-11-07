//
// PDFSelectionChildView.swift
// Nimble
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import SwiftUI
import TextSourceKit

struct PDFSelectionChildView: View {
  internal init(_url: URL = .init(string: "https://apple.com")!, textModel: TextModel) {
    self._url = _url
    self.textModel = textModel
  }
  var _url: URL
  
  var fileURL: Binding<URL> {
    Binding<URL>.init(get: {
      return _url
    }, set: {
      guard !$0.absoluteString.isEmpty else {
        errorPicking = true
        return
      }
      do {
        let source = try PDFTextSource($0)
        textModel.changeSource(to: source)
        pickingCompleted = true
        dump(source)
      } catch {
        print(error)
        errorPicking = true
      }
    })
  }
  
  @State private var showDocumentPicker = false
  @State var pickingCompleted = false
  @State var errorPicking = false
  let textModel: TextModel
  
  var body: some View {
    VStack {
      if !pickingCompleted {
        if errorPicking {
          Text("Error selecting file, please try again")
            .padding()
        }
        Button("Import file") {
          showDocumentPicker = true
        }
      } else {
        Text("File selected!")
      }
    }.sheet(
      isPresented: $showDocumentPicker) {
      PDFDocumentPicker(fileURL: fileURL)
    }
  }
}
