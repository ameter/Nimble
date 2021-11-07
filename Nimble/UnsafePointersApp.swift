//
//  UnsafePointersApp.swift
//  UnsafePointers
//
//  Created by UnsafePointers on 11/5/21.
//

import SwiftUI
import TextSourceKit

@main
struct UnsafePointersApp: App {
    var body: some Scene {
        WindowGroup {
//          ReaderView()
          ReaderView(viewModel: .init(textSource: MockTextSource()))
        }
    }
}
