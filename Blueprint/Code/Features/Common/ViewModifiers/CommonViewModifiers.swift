import SwiftUI

struct OvalButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .frame(maxWidth: .infinity, maxHeight: 60)
            .foregroundColor(CustomColor.textLight)
            .background(CustomColor.primary)
            .cornerRadius(10)
    }
}

struct AuthTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 50)
            .padding([.leading, .trailing], 10)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(CustomColor.border))
    }
}

struct AuthTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .foregroundColor(CustomColor.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
