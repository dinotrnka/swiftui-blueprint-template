import SwiftUI

struct RootView: View {

    @EnvironmentObject var auth: Auth

    @State private var showFeatureTogglesSheet: Bool = false

    var body: some View {
        NavigationView {
            if auth.loggedIn {
                MainView()
            } else {
                LandingView()
            }
        }
        .onReceive(shakePublisher) { _ in showFeatureTogglesSheet = true }
        .modifier(FeatureToggleModifier(showFeatureTogglesSheet: $showFeatureTogglesSheet))
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
