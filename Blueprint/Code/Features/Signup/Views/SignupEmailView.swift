//
//  SignupView.swift
//  Blueprint
//
//  Created by Dino Trnka on 19. 2. 2021..
//

import SwiftUI

struct SignupEmailView: View {

    @ObservedObject var viewModel: SignupViewModel

    var body: some View {
        VStack {

            Spacer()

            Text("Signup.EmailTitle".localized)
                .modifier(AuthTitle())

            Spacer()
                .frame(height: 50)

            AuthTextField(
                title: "Signup.EmailField".localized,
                text: $viewModel.email
            )

            Spacer()

            Button(action: viewModel.signup, label: {
                Text("Signup.ContinueButtonTitle".localized)
                    .modifier(MainButton())
            })
        }
        .padding(30)
        .modifier(Screen())
    }
}

struct SignupEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignupEmailView(viewModel: SignupViewModel())
    }
}
