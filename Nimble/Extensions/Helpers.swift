//
// Helpers.swift
// UnsafePointers
//
// Created by UnsafePointers on 11/6/21.
// License: Apache 2.0
  

import Foundation

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
