//
// IntSlider.swift
// Nimble
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import SwiftUI

struct IntSlider: View {
  @ObservedObject var viewModel: ReaderViewModel
  
  var bridge: Binding<Double> {
    Binding<Double>.init(get: {
      Double(viewModel.wpm)
    }, set: {
      viewModel.wpm = Int($0)
    })
  }
  
  var body: some View {
    VStack {
      Text("\(viewModel.wpm) words / min.")
      Slider(value: bridge, in: 60...500, step: 5) { _ in }
    }
  }
}
