//
//  LoginView.swift
//  Blueprint
//
//  Created by Dino Trnka on 19. 2. 2021..
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()

    var body: some View {
        VStack {

            Spacer()

            VStack(spacing: 40) {
                AuthTextField(
                    title: "Login.UsernameField".localized,
                    text: $viewModel.username
                )

                AuthTextField(
                    title: "Login.PasswordField".localized,
                    text: $viewModel.password,
                    secure: true
                )
            }

            Spacer()

            Button(action: viewModel.login, label: {
                Text("Login.LoginButtonTitle".localized)
                    .modifier(MainButton())
            })

        }
        .padding(30)
        .modifier(Screen())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
