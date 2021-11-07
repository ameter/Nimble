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

struct RunningView: View {
    @EnvironmentObject private var viewModel: ReaderViewModel
    
    var body: some View {
        Text(viewModel.currentWord)
            .padding()
            .onTapGesture(perform: viewModel.tap)
    }
}

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

struct SourceView: View {
    @EnvironmentObject private var viewModel: ReaderViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach((1...10).reversed(), id: \.self) {
                    Button("Source \($0)") {
                        viewModel.selectSource()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject private var viewModel: ReaderViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                Button("Setting") {
                    
                }
            }
        }
    }
}
