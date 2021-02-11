//
//  CustomColor.swift
//  Example
//
//  Created by Dino Trnka on 11. 2. 2021..
//

import SwiftUI

class CustomColor {

  static var background: Color {
    dynamic(light: .lightBeige, dark: .darkModeBlue)
  }

  static var primary: Color {
    dynamic(light: .orange, dark: .orange)
  }

  static var text: Color {
    dynamic(light: .darkBlue, dark: .lightBeige)
  }

  static var secondary: Color {
    dynamic(light: .green, dark: .green)
  }

  static var gradient: Gradient {
    Gradient(colors: [
      dynamic(light: .tumbleweed, dark: .tumbleweed),
      dynamic(light: .africanViolet, dark: .africanViolet),
      dynamic(light: .liberty, dark: .liberty)
    ])
  }
}

private extension CustomColor {
  static func dynamic(
    light: RawColor,
    _ lightAlpha: CGFloat = 1.0,
    dark: RawColor,
    _ darkAlpha: CGFloat = 1.0
  ) -> Color {
    UIColor.dynamic(
      light: light.rawValue,
      lightAlpha: lightAlpha,
      dark: dark.rawValue,
      darkAlpha: darkAlpha
    )
    .swiftUIColor()
  }

}
