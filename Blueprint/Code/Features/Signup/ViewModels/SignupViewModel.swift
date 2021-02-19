//
//  SignupViewModel.swift
//  Blueprint
//
//  Created by Dino Trnka on 19. 2. 2021..
//

import Foundation

class SignupViewModel: ObservableObject, APIRequestDelegate {

    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""

    func signup() {
        print("SIGNUP")
        print(" ")
        print("USERNAME", username)
        print("PASSWORD", password)
        print("EMAIL", email)

        SignupAction(
            delegate: self,
            parameters: SignupRequest(
                username: username,
                password: password,
                email: email
            )
        ).call { response in
            print("Login response")
        }
    }

    func onError(error: APIError) {
        print("Login View error", error.message)
    }

}
