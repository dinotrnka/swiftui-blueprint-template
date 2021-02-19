//
//  SignupView.swift
//  Blueprint
//
//  Created by Dino Trnka on 19. 2. 2021..
//

import SwiftUI

struct SignupUsernameView: View {

    @ObservedObject var viewModel: SignupViewModel = SignupViewModel()

    var body: some View {
        VStack {

            Spacer()

            Text("Signup.UsernameTitle".localized)
                .modifier(AuthTitle())

            Spacer()
                .frame(height: 25)

            TextField(
                "Signup.UsernameField".localized,
                text: $viewModel.username
            )
                .modifier(AuthTextField())

            Spacer()

            NavigationLink(
                destination: SignupPasswordView(
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

struct SignupUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        SignupUsernameView()
    }
}
