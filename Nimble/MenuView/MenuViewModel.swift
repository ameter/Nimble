//
// MenuViewModel.swift
// Nimble
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0


import SwiftUI
import TextSourceKit

class MenuViewModel: ObservableObject {
  let textModel: TextModel
  init(textModel: TextModel) {
    self.textModel = textModel
  }
  
  let options = TextSourceSelection.allOptions
}
