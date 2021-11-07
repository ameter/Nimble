//
//  ReaderView.swift
//  UnsafePointers
//
//  Created by UnsafePointers on 11/5/21.
//

import SwiftUI
import Combine
import TextSourceKit

struct ReaderView: View {
  @ObservedObject var viewModel: ReaderViewModel
  @State private var showingMenu = false
  @State private var showingSettings = false
  @State private var isRunning = false
  
  var body: some View {
    VStack {
      HStack {
        
        ModalIconButton(
          displayingModal: $showingMenu,
          image: Image(systemName: "menucard"),
          modal: MenuView.init
        )
          .hidden(viewModel.isRunning)
        Spacer()
        ModalIconButton(
          displayingModal: $showingSettings,
          image: Image(systemName: "gear"),
          modal: SettingsView.init
        )
          .hidden(viewModel.isRunning)
      }.padding()
      Spacer()
      Text(viewModel.currentWord)
      Spacer()
    }
    .gesture(
      TapGesture()
        .onEnded {
          print("Tap Gesture")
          viewModel.runStatusToggle()
        }
    )
  }
}

struct ReaderView_Previews: PreviewProvider {
  static var previews: some View {
    ReaderView(viewModel: .init(textSource: MockTextSource()))
      .previewAllColorSchemes
  }
}


extension ReaderView {
  struct ModalIconButton<Modal: View>: View {
    @Binding var displayingModal: Bool
    let image: Image
    let modal: () -> Modal
    
    var body: some View {
      Button {
        displayingModal.toggle()
      } label: {
        image
          .foregroundColor(.primary)
          .imageScale(.large)
      }
      .sheet(isPresented: $displayingModal, content: modal)
    }
  }
}
