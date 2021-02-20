import SwiftUI

struct Screen: ViewModifier {
    
    var color: Color = CustomColor.background
    
    func body(content: Content) -> some View {
        return ZStack {
            color.edgesIgnoringSafeArea(.all)
            
            content
        }
    }
}

struct MainButton: ViewModifier {
    
    var color: Color = CustomColor.primary
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .frame(maxWidth: .infinity, maxHeight: 60)
            .foregroundColor(CustomColor.buttonText)
            .background(color)
            .cornerRadius(10)
    }
}

struct AuthTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .foregroundColor(CustomColor.text)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FeatureToggleModifier: ViewModifier {
    
    @Binding var showFeatureTogglesSheet: Bool
    
    func body(content: Content) -> some View {
        return content
            .actionSheet(isPresented: $showFeatureTogglesSheet) {
                ActionSheet(
                    title: Text("Feature Toggles"),
                    buttons: FeatureToggles.shared.buttons
                )
            }
    }
}
