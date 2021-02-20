import SwiftUI

class CustomColor {

    static var background: Color {
        dynamic(light: .white, dark: .thunder)
    }

    static var primary: Color {
        dynamic(light: .purple, dark: .orange)
    }

    static var secondary: Color {
        dynamic(light: .red, dark: .akaroa)
    }

    static var danger: Color {
        dynamic(light: .red, dark: .akaroa)
    }

    static var text: Color {
        dynamic(light: .purple, dark: .orange)
    }

    static var buttonText: Color {
        dynamic(light: .white, dark: .thunder)
    }

    static var border: Color {
        dynamic(light: .purple, dark: .orange)
    }

    static var gradient: Gradient {
        Gradient(colors: [
            dynamic(light: .shark),
            dynamic(light: .red),
            dynamic(light: .white)
        ])
    }
}

private extension CustomColor {

    static func dynamic(
        light: RawColor,
        _ lightAlpha: CGFloat = 1.0,
        dark: RawColor? = nil,
        _ darkAlpha: CGFloat? = nil
    ) -> Color {
        UIColor.dynamic(
            light: light.rawValue,
            lightAlpha: lightAlpha,
            dark: dark?.rawValue ?? light.rawValue,
            darkAlpha: darkAlpha ?? lightAlpha
        )
        .swiftUIColor()
    }

}
