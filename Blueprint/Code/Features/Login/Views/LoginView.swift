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

            VStack(spacing: 20) {
                TextField("Login.UsernameField".localized, text: $viewModel.username)
                    .modifier(AuthTextField())

                SecureField("Login.PasswordField".localized, text: $viewModel.password)
                    .modifier(AuthTextField())
            }

            Spacer()

            Button(action: viewModel.login, label: {
                Text("Login.LoginButtonTitle".localized)
                    .modifier(OvalButton())
            })

        }
        .padding(30)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
