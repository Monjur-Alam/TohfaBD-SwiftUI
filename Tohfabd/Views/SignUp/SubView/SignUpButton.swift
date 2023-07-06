//
//  SignUpButton.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct SignUpButton: View {
    var body: some View {
        HStack{
            NavigationLink {
                HomeScreen()
            } label: {
                Text("Submit & Register")
                    .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(14/baseWidth)))
                    .padding(.all, deviceWidth*(16/baseWidth))
                    .foregroundColor(Color.white)
                    .frame(width: deviceWidth-32, alignment: .center)
            }
        }
        .background(Color("PrimaryColor"))
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .lineLimit(1)
    }
}

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButton()
    }
}
