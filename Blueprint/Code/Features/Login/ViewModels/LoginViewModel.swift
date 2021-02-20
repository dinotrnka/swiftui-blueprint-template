//
//  LoginViewModel.swift
//  Blueprint
//
//  Created by Dino Trnka on 19. 2. 2021..
//

import Foundation

class LoginViewModel: ObservableObject, APIRequestDelegate {
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    func login() {
        LoginAction(
            delegate: self,
            parameters: LoginRequest(
                username: username,
                password: password
            )).call { response in
                Auth.shared.setCredentials(
                    accessToken: response.accessToken,
                    refreshToken: response.refreshToken
                )
            }
    }
    
    func onError(error: APIError) {
        print("Login View error", error.message)
    }
}
