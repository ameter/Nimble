//
// ReaderViewModel.swift
// UnsafePointers
//
// Created by UnsafePointers on 11/6/21.
// License: Apache 2.0
  

import SwiftUI
import Combine
import TextSourceKit

class ReaderViewModel: ObservableObject {
  @Published var currentWord = "Tap to begin"
  @Published var isRunning = false
  @Published var wpm = 120
  
  var textModel: TextModel
  
  init(textSource: TextSourceKit.TextSource = MockTextSource()) {
    self.textModel = .init(source: textSource)
  }
  
  func goBack10() {
    // TODO
  }
  
  func goForward10() {
    // TODO
  }
  
  var timer = Timer.publish(every: 0.5, on: .main, in: .default).autoconnect()
  var timerCancellable: AnyCancellable?
  
  func runStatusToggle() {
    isRunning.toggle()
    if !isRunning { timer.upstream.connect().cancel() }
    else {
      let interval = 60 / Double(wpm)
      timer = Timer.publish(every: interval, on: .main, in: .default).autoconnect()
      timerCancellable = timer.sink { [unowned self] v in
        if let word = textModel.next() {
          self.currentWord = word
        } else {
          timer.upstream.connect().cancel()
        }
        
//          self.currentIndex += 1
//          if self.currentIndex == self.wordBank.count - 1 {
//            timer.upstream.connect().cancel()
//          }
//        self.currentWord = textModel.next() ?? "" //self.wordBank[self.currentIndex]
      }
    }
  }
}
