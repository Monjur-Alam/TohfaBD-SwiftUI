//
//  ChangePasswordButton.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct ChangePasswordButton: View {
    var height = UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        HStack{
            NavigationLink {
                HomeScreen()
            } label: {
                Text("Change Password")
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

struct ChangePasswordButton_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordButton()
    }
}
