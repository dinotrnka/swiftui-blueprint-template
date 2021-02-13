import SwiftUI

class CustomColor {

    static var background: Color {
        dynamic(light: .lightBeige, dark: .darkModeBlue)
    }

    static var primary: Color {
        dynamic(light: .orange)
    }

    static var text: Color {
        dynamic(light: .darkBlue, dark: .red)
    }

    static var secondary: Color {
        dynamic(light: .green)
    }

    static var gradient: Gradient {
        Gradient(colors: [
            dynamic(light: .tumbleweed),
            dynamic(light: .africanViolet),
            dynamic(light: .liberty)
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
