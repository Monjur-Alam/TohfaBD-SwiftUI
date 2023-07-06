//
//  NavigationBarView.swift
//  Tohfabd
//
//  Created by MacBook Pro on 10/1/23.
//

import SwiftUI

struct NavigationBarView: View {
    @Binding var isSidebarVisible: Bool
    @State private var isAnimated: Bool = false
    
    var body: some View {
        HStack (spacing: 3) {
            Button(action: {
                isSidebarVisible.toggle()
            }, label: {
                Image("menu")
                    .font(.title)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 30)
                    .opacity(isAnimated ? 1.0 : 0)
                    .offset(x: 0, y: isAnimated ? 0 : -25)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.5)) {
                            isAnimated.toggle()
                        }
                    }
                Spacer()
            }
            
            Spacer()
            
            Button(action: {}, label: {
                ZStack {
                    Image("notification_bell")
                        .frame(width: 24, height: 24)
                    ZStack {
                        Text("1")
                            .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(14/baseWidth)))
                            .lineLimit(1)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 1)
                            .foregroundColor(Color.white)
                            .background(Color("secondaryColor"))
                            .cornerRadius(15)
                    }
                    .padding(.leading, 25)
                    .padding(.bottom, 25)
                } //: ZStack
            }) //: Button
            
            Button(action: {}, label: {
                ZStack {
                    Image("cart")
                        .frame(width: 24, height: 24)
                    ZStack {
                        Text("1")
                            .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(14/baseWidth)))
                            .lineLimit(1)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 1)
                            .foregroundColor(Color.white)
                            .background(Color("secondaryColor"))
                            .cornerRadius(15)
                    }
                    .padding(.leading, 25)
                    .padding(.bottom, 25)
                } //: ZStack
            }) //: Button
        } //: HStack
    } //: Body
}

// MARK: - Preview
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(isSidebarVisible: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

