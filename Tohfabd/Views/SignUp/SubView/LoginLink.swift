//
//  LoginLink.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct LoginLink: View {
    var body: some View {
        HStack {
            Text("Already have an account?")
                .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(12/baseWidth)))
                .lineSpacing(10)
            .foregroundColor(Color("textSubTitle"))
            NavigationLink{
                LogInScreen()
            } label: {
                Text("Login")
                    .font(.custom(Fonts.semiBold.rawValue, size: deviceWidth*(14/baseWidth)))
                .foregroundColor(Color("PrimaryColor"))
            }
        }
    }
}

struct LoginLink_Previews: PreviewProvider {
    static var previews: some View {
        LoginLink()
    }
}
