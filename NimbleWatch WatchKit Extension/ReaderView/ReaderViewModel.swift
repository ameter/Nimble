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
    @Published var currentWord: String = ""
    @Published var currentSource: TextModel?
    @Published var sources = [TextModel]()
    @Published var isRunning = false
    private var timerCancellable: Cancellable?
    
    func selectSource() {
        print("\(#function)")
        currentSource = TextModel(source: MockTextSource())
    }
    
    func tap() {
        if isRunning {
            stop()
        } else {
            start()
        }
    }
    
    func start() {
        print("\(#function)")
        guard let source = currentSource else { return }
        timerCancellable = Timer.publish(every: 0.5, on: .main, in: .default).autoconnect().sink { [unowned self]  _ in
            currentWord = source.next() ?? ""
        }
        isRunning = true
    }
    
    func stop() {
        print("\(#function)")
        timerCancellable?.cancel()
        isRunning = false
    }
}