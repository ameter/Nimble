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
        Text(viewModel.currentWord)
            .padding()
            .onTapGesture(perform: viewModel.tap)
            .onLongPressGesture(perform: longPress)
    }
    
    func longPress() {
        print("long pressed")
    }
}

struct ReaderView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderView()
    }
}
