//
//  ForgotPassword.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    @State var email: String = ""
    @State private var isEmailEmpty: Bool = false
    @State private var isEmailValid: Bool = true
    
    @StateObject private var sendEmailViewModel = SendEmailViewModel()
    
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
                    Text("Forgot Password")
                        .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(30/baseWidth)))
                        .foregroundColor(Color("textTitle"))
                    Spacer()
                }
                HStack{
                    Text("Enter the email associated with your account and we’ll send an email with instructions to reset your password.")
                        .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(12/baseWidth)))
                        .foregroundColor(Color("textSubTitle"))
                        .padding(.vertical, 15)
                    Spacer()
                }
                VStack (spacing: 15) {
                    TextField("Email", text: $email, onEditingChanged: { isEditing in
                        if !isEditing {
                            self.isEmailValid = EmailValidator.isValidEmail(email: email)
                            self.isEmailEmpty = email.isEmpty
                        }
                    })
                    .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(14/baseWidth)))
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("borderColor"), lineWidth: 0.75)
                    )
                    
                    if isEmailEmpty {
                        HStack {
                            Text("Mandatory field")
                                .font(.caption2)
                                .foregroundColor(.red)
                            Spacer()
                        }
                    } else if !isEmailValid {
                        HStack {
                            Text("Invalid email")
                                .font(.caption2)
                                .foregroundColor(.red)
                            Spacer()
                        }
                        
                    }
                    
                    NavigationLink(destination: VerificationScreen(email: email), isActive: $sendEmailViewModel.navigateToVerificarionView) {
                        Button(action: {
                            if !email.isEmpty && EmailValidator.isValidEmail(email: email) {
                                isEmailEmpty = false
                                isEmailValid = true
                                let request = SendEmailRequest(email: email)
                                sendEmailViewModel.sendEmailRequest(request: request)
                                print("Wow... Forgot Password form validation perfect...!!")
                            } else {
                                if !email.isEmpty {
                                    isEmailEmpty = false
                                    print("isEmailEmpty: false")
                                    if EmailValidator.isValidEmail(email: email) {
                                        isEmailValid = true
                                        print("isEmailValid: true")
                                    } else {
                                        isEmailValid = false
                                        print("isEmailValid: false")
                                    }
                                } else {
                                    isEmailEmpty = true
                                    print("isEmailEmpty: true")
                                }
                                print("-------- Checked -------")
                            }
                        }) {
                            Text("Continue")
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
            .alert(isPresented: $sendEmailViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(sendEmailViewModel.errorMessage), dismissButton: .default(Text("Ok")))
            }
            .padding(EdgeInsets(top: deviceWidth*(35/baseWidth), leading: deviceWidth*(16/baseWidth), bottom: 0, trailing: deviceWidth*(16/baseWidth)))
            
            if case .LOADING = sendEmailViewModel.curentState {
                ProgressIndicator()
            }
        }
//        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ForgotPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordScreen()
    }
}
