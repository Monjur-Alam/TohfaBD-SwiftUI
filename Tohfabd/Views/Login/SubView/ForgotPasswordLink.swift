//
//  ForgotPasswordLink.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct ForgotPasswordLink: View {
    var body: some View {
        HStack {
            NavigationLink{
                ForgotPasswordScreen()
            } label: {
                Text("Forgot Password?")
                    .font(.custom(Fonts.semiBold.rawValue, size: deviceWidth*(14/baseWidth)))
                .foregroundColor(Color("PrimaryColor"))
            }
        }
    }
}

struct ForgotPasswordLink_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordLink()
    }
}
