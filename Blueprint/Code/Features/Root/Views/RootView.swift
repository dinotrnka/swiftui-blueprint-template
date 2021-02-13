import SwiftUI

struct RootView: View {

    @State private var showFeatureTogglesSheet: Bool = false

    var body: some View {
        NavigationView {
            LandingView()
        }
        .onReceive(shakePublisher) { _ in showFeatureTogglesSheet = true }
        .modifier(FeatureToggleModifier(showFeatureTogglesSheet: $showFeatureTogglesSheet))
        .environmentObject(FeatureToggles.shared)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
