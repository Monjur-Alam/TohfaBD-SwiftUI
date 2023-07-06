//
//  EmailTextField.swift
//  Tohfabd
//
//  Created by MacBook Pro on 1/1/23.
//

import SwiftUI

struct EmailTextField: View {
    @State private var email: String = ""
    @State private var isEmailValid: Bool = true
    var body: some View {
        TextField("Email*", text: $email, onEditingChanged: { isEditing in      // when open cursor
            if !isEditing {
                self.isEmailValid = EmailValidator.isValidEmail(email: self.email)
            }
        })
        .textFieldStyle(RoundedBorderTextFieldStyle())
        if !isEmailValid {
            HStack {
                Text("Invalid email")
                    .font(.caption)
                .foregroundColor(.red)
                Spacer()
            }
            .padding(.top, -10)
        }
    }
}


struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextField()
    }
}
