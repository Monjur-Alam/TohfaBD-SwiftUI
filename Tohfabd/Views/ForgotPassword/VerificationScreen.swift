//
//  VerificationScreen.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct VerificationScreen: View {
    var email: String?
    
    @State private var code: String = ""
    @State private var isCodeEmpty: Bool = false
    
    @StateObject private var verifyCodeViewModel = VerifyCodeViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                //            Spacer()
                HStack {
                    Spacer()
                    Image(uiImage: UIImage(named: "logo")!)
                        .frame(width: deviceWidth*(105/baseWidth), height: deviceWidth*(30/baseWidth))
                    Spacer()
                }
                Spacer()
                HStack{
                    Text("Verification")
                        .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(30/baseWidth)))
                        .foregroundColor(Color("textTitle"))
                    Spacer()
                }
                HStack{
                    Text("Enter 6 digits code that you received in your email.")
                        .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(12/baseWidth)))
                        .foregroundColor(Color("textSubTitle"))
                        .padding(.vertical, 15)
                    Spacer()
                }
                VStack (spacing: 15) {
                    VStack {
                        TextField("Varification code", text: $code, onEditingChanged: { isEditing in
                            if !isEditing {
                                self.isCodeEmpty = code.isEmpty
                            }
                        })
                        .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(14/baseWidth)))
                        .keyboardType(.numberPad)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("borderColor"), lineWidth: 0.75)
                        )
                        
                        if isCodeEmpty {
                            HStack {
                                Text("Mandatory field")
                                    .font(.caption2)
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                    
                    NavigationLink(destination: ResetPasswordScreen(email: email), isActive: $verifyCodeViewModel.navigateToResetPasswordView) {
                        Button(action: {
                            if !code.isEmpty {
                                isCodeEmpty = false
                                print("Wow... Forgot Password form validation perfect...!!")
                                let request = VerifyCodeRequest(email: email, code: code)
                                verifyCodeViewModel.verifyCodeRequest(request: request)
                            } else {
                                if !code.isEmpty {
                                    isCodeEmpty = false
                                    print("isCodeEmpty: false")
                                } else {
                                    isCodeEmpty = true
                                    print("isCodeEmpty: true")
                                }
                                print("-------- Checked -------")
                            }
                        }) {
                            Text("Verify")
                                .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(14/baseWidth)))
                                .padding(.all, deviceWidth*(16/baseWidth))
                                .foregroundColor(Color.white)
                                .frame(width: deviceWidth-32, alignment: .center)
                                .background(Color("PrimaryColor"))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .lineLimit(1)
                        }
                    }
                    
                    HStack {
                        Spacer()
                        RegistrationLink()
                        Spacer()
                    }
                }
                .padding(.vertical)
                Spacer()
            }
            .alert(isPresented: $verifyCodeViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(verifyCodeViewModel.errorMessage), dismissButton: .default(Text("Ok")))
            }
            .padding(EdgeInsets(top: deviceWidth*(50/baseWidth), leading: deviceWidth*(16/baseWidth), bottom: 0, trailing: deviceWidth*(16/baseWidth)))
            
            if case .LOADING = verifyCodeViewModel.curentState {
                ProgressIndicator()
            }
        }
//        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VerificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        VerificationScreen()
    }
}
