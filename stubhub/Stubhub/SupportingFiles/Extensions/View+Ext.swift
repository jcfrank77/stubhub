//
//  View+Ext.swift
//  stubhub (iOS)
//
//  Created by Joel Frank on 30/08/2022.
//

import Foundation
import SwiftUI


extension View {
  func fullScreen() -> some View {
    self.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
  }
  
  func maxScreenWidth() -> some View {
    self.frame(maxWidth: UIScreen.main.bounds.width)
  }
  
  func leftJustify() -> some View {
    self.frame(maxWidth: .infinity, alignment: .leading)
  }
  
}
