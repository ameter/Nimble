//
// SettingsView.swift
// NimbleWatch WatchKit Extension
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var viewModel: ReaderViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var intProxy: Binding<Double>{
        Binding<Double>(get: {
            //returns the score as a Double
            return Double(viewModel.wpm)
        }, set: {
            //rounds the double to an Int
            print($0.description)
            viewModel.wpm = Int($0)
        })
    }
    
    var body: some View {
        List {
            VStack {
                Text("Words per minute:")
                Text("\(viewModel.wpm)")
                Slider(value: intProxy, in: 100...500, step: 50)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
