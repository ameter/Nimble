//
// View+Hidden.swift
// Nimble
//
// Created by UnsafePointers on 11/7/21.
// License: Apache 2.0
  
import SwiftUI

extension View {
  @ViewBuilder func hidden(_ hide: Bool) -> some View {
    opacity(hide ? 0 : 1)
  }
}
