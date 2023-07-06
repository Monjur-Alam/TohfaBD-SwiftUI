//
//  LoginWithGoogle.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct LoginWithGoogle: View {
    var body: some View {
        HStack{
            Spacer()
            Image(uiImage: UIImage(named: "google")!)
                .frame(width: deviceWidth*(21/baseWidth), height: deviceWidth*(21/baseWidth))
            Button("Login with Google") {
                
            }
            .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(14/baseWidth)))
            .padding(.vertical, deviceWidth*(16/baseWidth))
            .foregroundColor(Color.black)
            Spacer()
        }
        .background(Color("grayColor"))
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .lineLimit(1)
    }
}

struct LoginWithGoogle_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithGoogle()
    }
}
