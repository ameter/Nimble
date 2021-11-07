//
// TextModel.swift
// UnsafePointers
//
// Created by UnsafePointers on 11/6/21.
// License: Apache 2.0
  

import Foundation
import TextSourceKit

class TextModel: Sequence {
    public var currentIndex: Int?
    
    private let words: [String]
    
    init(source: TextSource) {
        words = source.fetch(count: 1_000_000)
    }
    
    func makeIterator() -> TextIterator {
        TextIterator(words)
    }
    
    public func next() -> String? {
        if currentIndex == nil {
            return first()
        }
        guard let currentIndex = currentIndex else { return nil }
        return word(currentIndex + 1)
    }
    
    public func previous() -> String? {
        guard let currentIndex = currentIndex else { return nil }
        return word(currentIndex - 1)
    }
    
    public func forward(_ n: Int) -> String? {
        if currentIndex == nil {
            return word(n)
        }
        guard let currentIndex = currentIndex else { return nil }
        return word(currentIndex + n)
    }
    
    public func back(_ n: Int) -> String? {
        guard let currentIndex = currentIndex else { return nil }
        return word(currentIndex - n)
    }
    
    public func first() -> String? {
        word(0)
    }
    
    subscript(index: Int) -> String? {
        get {
            word(index)
        }
    }
    
    private func word(_ idx: Int) -> String? {
        if idx >= 0 && idx < words.count {
            currentIndex = idx
            return words[idx]
        } else {
            return nil
        }
    }
}

struct TextIterator: IteratorProtocol {
    private let words: [String]
    private var index: Int?

    init(_ words: [String]) {
        self.words = words
    }

    private func nextIndex() -> Int? {
        if let index = index, index < words.count - 1 {
            return index + 1
        }
        if index == nil, !words.isEmpty {
            return 0
        }
        return nil
    }

    mutating func next() -> String? {
        if let index = nextIndex() {
            self.index = index
            return words[index]
        }
        return nil
    }
}
