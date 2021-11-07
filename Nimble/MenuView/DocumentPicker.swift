//
// DocumentPicker.swift
// Nimble
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  

import SwiftUI

struct PDFDocumentPicker: UIViewControllerRepresentable {
  @Binding var fileURL: URL
  
  func makeCoordinator() -> DocumentPickerCoordinator {
    DocumentPickerCoordinator(fileURL: $fileURL)
  }
  
  func makeUIViewController(
    context: UIViewControllerRepresentableContext<PDFDocumentPicker>
  ) -> UIDocumentPickerViewController {
    let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf])
    picker.delegate = context.coordinator
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) { }
}

class DocumentPickerCoordinator: NSObject, UIDocumentPickerDelegate {
  @Binding var fileURL: URL
  
  init(fileURL: Binding<URL>) {
    _fileURL = fileURL
  }
  
  func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
  
    guard let url = urls.first else {
      // handle error
      print("No url")
      return
    }
    fileURL = url
  }
}
