//
// SourceView.swift
// NimbleWatch WatchKit Extension
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import SwiftUI

struct SourceView: View {
    @EnvironmentObject private var viewModel: ReaderViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach((1...10).reversed(), id: \.self) {
                    Button("Source \($0)") {
                        viewModel.selectSource()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceView()
    }
}
