//
//  AuthTextField.swift
//  Blueprint
//
//  Created by Dino Trnka on 20. 2. 2021..
//

import SwiftUI

struct AuthTextField: View {

    var title: String = ""

    @Binding var text: String

    var secure: Bool = false

    var body: some View {
        VStack {
            if secure {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(CustomColor.border)
        }
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(title: "username", text: .constant(""))
    }
}
