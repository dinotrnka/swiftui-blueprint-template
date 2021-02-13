import SwiftUI

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
