//
// WebsiteSelectionChildView.swift
// Nimble
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0


import SwiftUI
import TextSourceKit

struct WebsiteSelectionChildView: View {
  @State var urlString: String = ""
  @State var success = false
  @State var fetchError = false
  let textModel: TextModel
    
  var body: some View {
    VStack {
      Text("Successfully fetched text!")
        .hidden(!success)
      
      Text("Error fetching text, please try again.")
        .hidden(!fetchError)
      
      TextField("URL", text: $urlString)
        .keyboardType(.URL)
        .disableAutocorrection(true)
        .textFieldStyle(.roundedBorder)
        .padding()
      
      Button {
        verifyURL()
      } label: {
        Text("Done")
      }
      .buttonStyle(.bordered)
      .hidden(success)
    }
  }
  
  private func verifyURL() {
    guard let url = URL(string: urlString) else {
      return
    }
    Task.init {
      do {
        let source = try await WebsiteTextSource(url)
        textModel.changeSource(to: source)
        success = true
        dump(source)
      } catch {
        print(error)
        fetchError = true
      }
    }
  }
}
