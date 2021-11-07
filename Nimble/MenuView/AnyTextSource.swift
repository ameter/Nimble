//
// AnyTextSource.swift
// Nimble
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import Foundation
import TextSourceKit

struct AnyTextSource: TextSource {
  var words: [String] = []

  private let _fetch: (Int, Int?) -> [String]

  init<T: TextSource>(_ textSource: T) {
    _fetch = { textSource.fetch(index: $0, count: $1) }
  }

  func fetch(index: Int, count: Int?) -> [String] {
    _fetch(index, count)
  }
}
