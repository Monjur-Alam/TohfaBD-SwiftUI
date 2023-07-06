//
//  ChangePasswordScreen.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct ResetPasswordScreen: View {
    var email: String?
    
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordEmpty: Bool = false
    @State private var isConfirmPasswordEmpty: Bool = false
    @State private var isPasswordValid: Bool = true
    @State private var isConfirmPasswordValid: Bool = true
    
    @StateObject private var resetPasswordViewModel = ResetPasswordViewModel()
    
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
                    Text("Reset Password")
                        .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(30/baseWidth)))
                        .foregroundColor(Color("textTitle"))
                    Spacer()
                }
                HStack {
                    Text("Set the password for your account so you can login and access all the feature")
                        .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(12/baseWidth)))
                        .foregroundColor(Color("textSubTitle"))
                        .padding(.vertical, 15)
                    Spacer()
                }
                VStack (spacing: 15) {
                    //                Password field
                    VStack {
                        SecurePasswordField(password: $password)
                        if isPasswordEmpty {
                            HStack {
                                Text("Mandatory field")
                                    .font(.caption2)
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        } else if !isPasswordValid {
                            HStack {
                                Text("Invalid password")
                                    .font(.caption2)
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                    
                    //                Confirm password field
                    VStack {
                        SecureConfirmPasswordField(confirmPassword: $confirmPassword)
                        if isConfirmPasswordEmpty {
                            HStack {
                                Text("Mandatory field")
                                    .font(.caption2)
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        } else if !isConfirmPasswordValid {
                            HStack {
                                Text("Password are not matching")
                                    .font(.caption2)
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                    
                    NavigationLink(destination: LogInScreen(), isActive: $resetPasswordViewModel.navigateToLoginView) {
                        Button(action: {
                            if !password.isEmpty && PasswordValidator.isValidPassword(password: password) && !confirmPassword.isEmpty && password == confirmPassword {
                                isPasswordEmpty = false
                                isConfirmPasswordEmpty = false
                                isPasswordValid = true
                                let request = ResetPasswordRequest(email: email, password: password)
                                resetPasswordViewModel.resetPasswordRequest(request: request)
                                print("Wow... Signup form validation perfect...!!")
                            }
                            else {
                                if !password.isEmpty {
                                    isPasswordEmpty = false
                                    print("isPasswordEmpty: false")
                                    if PasswordValidator.isValidPassword(password: password) {
                                        isPasswordValid = true
                                        print("isPasswordValid: true")
                                        if !confirmPassword.isEmpty {
                                            isConfirmPasswordEmpty = false
                                            print("isConfirmPasswordEmpty: false")
                                            if password == confirmPassword {
                                                isConfirmPasswordValid = true
                                                print("isConfirmPasswordValid: true")
                                            } else {
                                                isConfirmPasswordValid = false
                                                print("isConfirmPasswordValid: false")
                                            }
                                        } else {
                                            isConfirmPasswordEmpty = true
                                            print("isConfirmPasswordEmpty: false")
                                        }
                                    } else {
                                        isPasswordValid = false
                                        print("isPasswordValid: false")
                                    }
                                } else {
                                    isPasswordEmpty = true
                                    print("isPasswordEmpty: true")
                                }
                                print("-------- Checked -------")
                            }
                        }) {
                            Text("Reset Password")
                                .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(14/baseWidth)))
                                .padding(.all, deviceWidth*(16/baseWidth))
                                .foregroundColor(Color.white)
                                .frame(width: deviceWidth-32, alignment: .center)
                                .background(Color("PrimaryColor"))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .lineLimit(1)
                        }
                    }
                }
                .padding(.vertical)
                Spacer()
            }
            .alert(isPresented: $resetPasswordViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(resetPasswordViewModel.errorMessage), dismissButton: .default(Text("Ok")))
            }
            .padding(EdgeInsets(top: deviceWidth*(50/baseWidth), leading: deviceWidth*(16/baseWidth), bottom: 0, trailing: deviceWidth*(16/baseWidth)))
            
            if case .LOADING = resetPasswordViewModel.curentState {
                ProgressIndicator()
            }
        }
//        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
    }
}
