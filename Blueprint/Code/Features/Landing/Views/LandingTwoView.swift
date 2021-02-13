import SwiftUI

struct LandingTwoView: View {

    @EnvironmentObject var featureToggles: FeatureToggles

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .background(featureToggles.isOn(featureToggle: .redBackground) ? Color.red : Color.white)
    }
}

struct LandingTwo_Previews: PreviewProvider {
    static var previews: some View {
        LandingTwoView()
    }
}
