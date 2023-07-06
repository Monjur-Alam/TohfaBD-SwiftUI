//
//  CustomSecureField.swift
//  Tohfabd
//
//  Created by MacBook Pro on 3/1/23.
//

import SwiftUI

struct SecurePasswordField: View {
    @FocusState var focused: focusedField?
    @State var showPassword: Bool = false
    @Binding var password: String
    
    var body: some View {
        HStack {
            ZStack(alignment: .trailing) {
                TextField("Password*", text: $password)
                    .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(14/baseWidth)))
                    .focused($focused, equals: .unSecure)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(.alphabet)
                    .opacity(showPassword ? 1 : 0)
                    .padding()
                SecureField("Password*", text: $password)
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
