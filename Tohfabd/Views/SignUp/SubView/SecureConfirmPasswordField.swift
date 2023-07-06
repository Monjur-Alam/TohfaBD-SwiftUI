//
//  SecureConfirmPasswordField.swift
//  Tohfabd
//
//  Created by MacBook Pro on 3/1/23.
//

import SwiftUI

struct SecureConfirmPasswordField: View {
    @FocusState var focused: focusedField?
    @State var showPassword: Bool = false
    @Binding var confirmPassword: String
    
    var body: some View {
        HStack {
            ZStack(alignment: .trailing) {
                TextField("Confirm password*", text: $confirmPassword)
                    .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(14/baseWidth)))
                    .focused($focused, equals: .unSecure)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(.alphabet)
                    .opacity(showPassword ? 1 : 0)
                    .padding()
                SecureField("Confirm password*", text: $confirmPassword)
                    .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(14/baseWidth)))
                    .focused($focused, equals: .secure)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .opacity(showPassword ? 0 : 1)
                    .padding()
                Button(action: {
                    showPassword.toggle()
                    focused = focused == .secure ? .unSecure : .secure
                }, label: {
                    Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill")
                        .padding()
                        .foregroundColor(Color("borderColor"))
                })
            }
        }.overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("borderColor"), lineWidth: 0.75)
        )
    }
    
    enum focusedField {
        case secure, unSecure
    }
}
