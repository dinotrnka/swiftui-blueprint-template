//
//  SignupView.swift
//  Blueprint
//
//  Created by Dino Trnka on 19. 2. 2021..
//

import SwiftUI

struct SignupPasswordView: View {

    @ObservedObject var viewModel: SignupViewModel

    var body: some View {
        VStack {

            Spacer()

            Text("Signup.PasswordTitle".localized)
                .modifier(AuthTitle())

            Spacer()
                .frame(height: 25)

            SecureField(
                "Signup.PasswordField".localized,
                text: $viewModel.password
            )
                .modifier(AuthTextField())

            Spacer()

            NavigationLink(
                destination: SignupEmailView(
                    viewModel: viewModel
                )
            ) {
                Text("Signup.ContinueButtonTitle".localized)
                    .modifier(OvalButton())
            }
        }
        .padding(30)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupPasswordView(viewModel: SignupViewModel())
    }
}
