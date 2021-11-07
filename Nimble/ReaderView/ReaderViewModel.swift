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
  var timer = Timer.publish(every: 0.5, on: .main, in: .default).autoconnect()
  
  var textSource: TextSourceKit.TextSource
  var cancellables = Set<AnyCancellable>()
  var wordBank: [String] = []
  var currentIndex = 0
  
  init(textSource: TextSourceKit.TextSource = MockTextSource()) {
    self.textSource = textSource
    wordBank = mockWords()
  }
  
  var timerCancellable: AnyCancellable?
  
  func runStatusToggle() {
    isRunning.toggle()
    if !isRunning { timer.upstream.connect().cancel() }
    else {
      timer = Timer.publish(every: 0.5, on: .main, in: .default).autoconnect()
      timerCancellable = timer.sink { [unowned self] v in
        self.currentIndex += 1
        if self.currentIndex == self.wordBank.count - 1 {
          timer.upstream.connect().cancel()
        }
        self.currentWord = self.wordBank[self.currentIndex]
      }
    }
  }
}

// Mocking
//extension ReaderViewModel {
//  func mockWords() -> [String] {
//    guard let wordsList = Bundle.main.path(forResource: "webster_dictionary", ofType: nil)
//            .flatMap({
//              try? String(contentsOfFile: $0)
//            })?
//            .components(separatedBy: .newlines)
//    else { return [] }
//
//    let zeroIndex = Int.random(in: 0...wordsList.count - 100)
//    return wordsList[zeroIndex...zeroIndex + 100].map { $0 }
//  }
//
//  func mock() {
//    wordBank = mockWords()
//    Timer.publish(every: 0.5, on: .main, in: .default)
//      .autoconnect()
//      .sink { [unowned self] v in
//        self.currentIndex += 1
//        if self.currentIndex == self.wordBank.count - 1 {
//          cancellables.forEach { $0.cancel() }
//        }
//        self.currentWord = self.wordBank[self.currentIndex]
//      }
//      .store(in: &cancellables)
//  }
//}
