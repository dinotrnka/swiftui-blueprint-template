import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack {
            Spacer()

            NavigationLink(destination: SignupUsernameView()) {
                Text("Landing.SignupButtonTitle".localized)
                    .modifier(OvalButton())
            }

            Spacer()
                .frame(height: 20)

            NavigationLink(destination: LoginView()) {
                Text("Landing.LoginButtonTitle".localized)
                    .modifier(OvalButton())
            }
        }
        .padding(30)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
