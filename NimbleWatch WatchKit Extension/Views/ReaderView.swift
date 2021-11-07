//
//  ContentView.swift
//  UnsafePointersWatch WatchKit Extension
//
//  Created by UnsafePointers on 11/6/21.
//

import SwiftUI
import TextSourceKit

struct ReaderView: View {
    @StateObject var viewModel = ReaderViewModel()
    
    var body: some View {
        Group {
            if viewModel.isRunning {
                RunningView()
            } else {
                PausedView()
            }
        }
        .environmentObject(viewModel)
    }
}

struct ReaderView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderView()
    }
}
