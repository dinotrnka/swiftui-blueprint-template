//
//  ColorExtension.swift
//  Example
//
//  Created by Dino Trnka on 11. 2. 2021..
//

import SwiftUI

extension Color {

  init(hex: UInt, alpha: Double = 1) {
    self.init(
      red: Double((hex & 0xFF0000) >> 16) / 255.0,
      green: Double((hex & 0xFF00) >> 8) / 255.0,
      blue: Double(hex & 0xFF) / 255.0,
      opacity: alpha
    )
  }

  func uiColor() -> UIColor {
    return UIColor(self)
  }

}

extension UIColor {

  convenience init(hex: UInt, alpha: CGFloat = 1) {
    self.init(
      red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((hex & 0xFF00) >> 8) / 255.0,
      blue: CGFloat(hex & 0xFF) / 255.0,
      alpha: alpha
    )
  }

  static func dynamic(light: UInt, lightAlpha: CGFloat = 1, dark: UInt, darkAlpha: CGFloat = 1) -> UIColor {
    return UIColor { trait -> UIColor in
      switch trait.userInterfaceStyle {
      case .dark:
        return UIColor(hex: dark).withAlphaComponent(darkAlpha)
      case .light, .unspecified:
        return UIColor(hex: light).withAlphaComponent(lightAlpha)
      @unknown default:
        return UIColor(hex: light).withAlphaComponent(lightAlpha)
      }
    }
  }
  
  func swiftUIColor() -> Color {
    return Color(self)
  }
  
}
