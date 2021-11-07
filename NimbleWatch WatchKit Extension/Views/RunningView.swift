//
// RunningView.swift
// NimbleWatch WatchKit Extension
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import SwiftUI

struct RunningView: View {
    @EnvironmentObject private var viewModel: ReaderViewModel
    
    var body: some View {
        Text(viewModel.currentWord)
            .padding()
            .onTapGesture(perform: viewModel.tap)
    }
}

struct RunningView_Previews: PreviewProvider {
    static var previews: some View {
        RunningView()
    }
}
