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
        print("LOGIN")
        print(" ")
        print("USERNAME", username)
        print("PASSWORD", password)
        
        LoginAction(
            delegate: self,
            parameters: LoginRequest(
                username: username,
                password: password
            )).call { response in
                print("Login response")
            }
    }
    
    func onError(error: APIError) {
        print("Login View error", error.message)
    }
}
