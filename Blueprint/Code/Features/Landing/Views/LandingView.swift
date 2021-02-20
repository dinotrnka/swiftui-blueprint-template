import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack {
            Spacer()

            NavigationLink(destination: SignupUsernameView()) {
                Text("Landing.SignupButtonTitle".localized)
                    .modifier(MainButton(color: CustomColor.secondary))
            }

            Spacer()
                .frame(height: 20)

            NavigationLink(destination: LoginView()) {
                Text("Landing.LoginButtonTitle".localized)
                    .modifier(MainButton())
            }
        }
        .padding(30)
        .modifier(Screen())
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
