//
//  LogInScreen.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct LogInScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var isEmailEmpty: Bool = false
    @State private var isPasswordEmpty: Bool = false
    @State private var isEmailValid: Bool = true
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            Image(uiImage: UIImage(named: "logo")!)
                                .frame(width: geometry.size.width*(105/baseWidth), height: geometry.size.width*(30/baseWidth))
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Text("Login")
                                .font(.custom(Fonts.medium.rawValue, size: geometry.size.width*(30/baseWidth)))
                                .foregroundColor(Color("textTitle"))
                            Spacer()
                        }
                        VStack (spacing: 15) {
                            VStack {
                                TextField("Email", text: $email, onEditingChanged: { isEditing in
                                    if !isEditing {
                                        self.isEmailValid = EmailValidator.isValidEmail(email: email)
                                        self.isEmailEmpty = email.isEmpty
                                    }
                                })
                                .font(.custom(Fonts.medium.rawValue, size: geometry.size.width*(14/baseWidth)))
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
                            }
                            
                            VStack {
                                SecurePasswordField(password: $password)
                                if isPasswordEmpty {
                                    HStack {
                                        Text("Mandatory field")
                                            .font(.caption2)
                                            .foregroundColor(.red)
                                        Spacer()
                                    }
                                }
                            }
                            
                            HStack {
                                Spacer()
                                ForgotPasswordLink()
                            }
                            
                            NavigationLink(destination: HomeScreen(), isActive: $loginViewModel.navigateToMainView) {
                                Button(action: {
                                    if !email.isEmpty && !password.isEmpty && EmailValidator.isValidEmail(email: email) {
                                        isPasswordEmpty = false
                                        isEmailEmpty = false
                                        isEmailValid = true
                                        let createLoginRequest = CreateLoginRequest(email: email, password: password)
                                        loginViewModel.createLogin(request: createLoginRequest)
                                        print("Wow... Login form validation perfect...!!")
                                    } else {
                                        if !email.isEmpty {
                                            isEmailEmpty = false
                                            print("isEmailEmpty: false")
                                            if EmailValidator.isValidEmail(email: email) {
                                                isEmailValid = true
                                                print("isEmailValid: true")
                                                if !password.isEmpty {
                                                    isPasswordEmpty = false
                                                    print("isPasswordEmpty: false")
                                                } else {
                                                    isPasswordEmpty = true
                                                    print("isPasswordEmpty: true")
                                                }
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
                                    Text("Login")
                                        .font(.custom(Fonts.regular.rawValue, size: geometry.size.width*(14/baseWidth)))
                                        .padding(.all, geometry.size.width*(16/baseWidth))
                                        .foregroundColor(Color.white)
                                        .frame(width: geometry.size.width-32, alignment: .center)
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
                        LoginWithGoogle()
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: geometry.size.width*(35/baseWidth), leading: geometry.size.width*(16/baseWidth), bottom: 0, trailing: geometry.size.width*(16/baseWidth)))
                    .alert(isPresented: $loginViewModel.showAlert) {
                        Alert(title: Text("Error"), message: Text(loginViewModel.errorMessage), dismissButton: .default(Text("Ok")))
                    }
                    if case .LOADING = loginViewModel.curentState {
                        ProgressIndicator()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
    }
}
