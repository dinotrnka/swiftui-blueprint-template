import SwiftUI

struct SignupUsernameView: View {

    @ObservedObject var viewModel: SignupViewModel = SignupViewModel()

    var body: some View {
        VStack {

            Spacer()

            Text("Signup.UsernameTitle".localized)
                .modifier(AuthTitle())

            Spacer()
                .frame(height: 50)

            AuthTextField(
                title: "Signup.UsernameField".localized,
                text: $viewModel.username
            )

            Spacer()

            NavigationLink(
                destination: SignupPasswordView(
                    viewModel: viewModel
                )
            ) {
                Text("Signup.ContinueButtonTitle".localized)
                    .modifier(MainButton())
            }
        }
        .padding(30)
        .modifier(Screen())
    }
}

struct SignupUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        SignupUsernameView()
    }
}
