import SwiftUI

@main
struct BlueprintApp: App {

    init() {
        NetworkMonitor.shared.startMonitoring()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(FeatureToggles.shared)
                .environmentObject(Auth.shared)
        }
    }
}
