//
// PausedView.swift
// NimbleWatch WatchKit Extension
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import SwiftUI

struct PausedView: View {
    @EnvironmentObject private var viewModel: ReaderViewModel
    @State private var showingSources = false
    @State private var showingSettings = false
    
    var body: some View {
        VStack {
            
            Button("Settings") {
                showingSettings = true
            }
            
            Button("Select Source") {
                showingSources = true
            }
            
            if viewModel.currentSource != nil {
                Button(action: viewModel.tap) {
                    Text("\(viewModel.currentSource?.currentIndex == nil ? "Start" : "Resume")")
                }
                .buttonStyle(BorderedButtonStyle(tint: .green))
            }
        }
        .fullScreenCover(isPresented: $showingSources) {
            SourceView()
        }
        .fullScreenCover(isPresented: $showingSettings) {
            SettingsView()
        }
    }
}

struct PausedView_Previews: PreviewProvider {
    static var previews: some View {
        PausedView()
    }
}
