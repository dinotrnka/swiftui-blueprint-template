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
                .frame(height: 25)

            TextField(
                "Signup.EmailField".localized,
                text: $viewModel.email
            )
                .modifier(AuthTextField())

            Spacer()

            Text("Signup.ContinueButtonTitle".localized)
                .modifier(OvalButton())
        }
        .padding(30)
    }
}

struct SignupEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignupEmailView(viewModel: SignupViewModel())
    }
}
