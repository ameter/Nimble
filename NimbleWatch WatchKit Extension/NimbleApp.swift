//
//  UnsafePointersApp.swift
//  UnsafePointersWatch WatchKit Extension
//
//  Created by UnsafePointers on 11/6/21.
//

import SwiftUI

@main
struct NimbleApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ReaderView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
