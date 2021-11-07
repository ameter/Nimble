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
  
  var textSource: TextSourceKit.TextSource
  var cancellables = Set<AnyCancellable>()
  var wordBank: [String] = []
  var currentIndex = 0
  
  init(textSource: TextSourceKit.TextSource = MockTextSource()) {
    self.textSource = textSource
    mock()
  }
}

// Mocking
extension ReaderViewModel {
  func mockWords() -> [String] {
    guard let wordsList = Bundle.main.path(forResource: "webster_dictionary", ofType: nil)
            .flatMap({
              try? String(contentsOfFile: $0)
            })?
            .components(separatedBy: .newlines)
    else { return [] }
    
    let zeroIndex = Int.random(in: 0...wordsList.count - 100)
    return wordsList[zeroIndex...zeroIndex + 100].map { $0 }
  }
  
  func mock() {
    wordBank = mockWords()
    Timer.publish(every: 0.5, on: .main, in: .default)
      .autoconnect()
      .sink { [unowned self] v in
        self.currentIndex += 1
        if self.currentIndex == self.wordBank.count {
          cancellables.forEach { $0.cancel() }
        }
        self.currentWord = self.wordBank[self.currentIndex]
      }
      .store(in: &cancellables)
  }
}
