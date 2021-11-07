//
// ReaderViewModel.swift
// NimbleWatch WatchKit Extension
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import Foundation
import TextSourceKit
import Combine

class ReaderViewModel: ObservableObject {
    @Published var currentWord: String = "Tap to begin"
    
    private var isRunning = false
    private var text = TextModel(source: MockTextSource())
    private var timerCancellable: Cancellable?
    
    func tap() {
        if isRunning {
            stop()
        } else {
            start()
        }
        isRunning.toggle()
    }
    
    func start() {
        print("\(#function)")
        timerCancellable = Timer.publish(every: 0.5, on: .main, in: .default).autoconnect().sink { [unowned self]  _ in
            currentWord = text.next() ?? "no more words"
        }
    }
    
    func stop() {
        print("\(#function)")
        timerCancellable?.cancel()
    }
}
