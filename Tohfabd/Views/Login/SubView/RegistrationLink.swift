//
//  RegistrationLink.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct RegistrationLink: View {
    var body: some View {
        HStack {
            Text("Don’t have an account?")
                .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(12/baseWidth)))
            .foregroundColor(Color("textSubTitle"))
            NavigationLink{
                SignUpScreen()
            } label: {
                Text("Create here")
                    .font(.custom(Fonts.semiBold.rawValue, size: deviceWidth*(14/baseWidth)))
                .foregroundColor(Color("PrimaryColor"))
            }
        }
    }
}

struct RegistrationLink_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationLink()
    }
}
