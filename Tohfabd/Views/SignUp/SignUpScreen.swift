//
//  SignUpScreen.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isFirstNameEmpty: Bool = false
    @State private var isLastNameEmpty: Bool = false
    @State private var isEmailEmpty: Bool = false
    @State private var isPhoneEmpty: Bool = false
    @State private var isPasswordEmpty: Bool = false
    @State private var isConfirmPasswordEmpty: Bool = false
    @State private var isEmailValid: Bool = true
    @State private var isPhoneValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var isConfirmPasswordValid: Bool = true
    
    @StateObject private var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Group {
                    HStack {
                        Spacer()
                        Image(uiImage: UIImage(named: "logo")!)
                            .frame(width: deviceWidth*(105/baseWidth), height: deviceWidth*(30/baseWidth))
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Text("Create an Account")
                            .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(30/baseWidth)))
                            .foregroundColor(Color("textTitle"))
                        Spacer()
                    }
                }
                VStack (spacing: 15) {
                    HStack {
                        VStack {
                            //                        First name field
                            TextField("First Name*", text: $firstName, onEditingChanged: { isEditing in
                                if !isEditing {
                                    self.isFirstNameEmpty = firstName.isEmpty
                                }
                            })
                            .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(14/baseWidth)))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("borderColor"), lineWidth: 0.75)
                            )
                            if isFirstNameEmpty {
                                HStack {
                                    Text("Mandatory field")
                                        .font(.caption2)
                                        .foregroundColor(.red)
                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                        
                        //                    Last name field
                        VStack {
                            TextField("Last Name*", text: $lastName, onEditingChanged: { isEditing in
                                if !isEditing {
                                    self.isLastNameEmpty = lastName.isEmpty
                                }
                            })
                            .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(14/baseWidth)))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("borderColor"), lineWidth: 0.75)
                            )
                            if isLastNameEmpty {
                                HStack {
                                    Text("Mandatory field")
                                        .font(.caption2)
                                        .foregroundColor(.red)
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    //                Email field
                    VStack {
                        TextField("Email*", text: $email, onEditingChanged: { isEditing in
                            if !isEditing {
                                self.isEmailValid = EmailValidator.isValidEmail(email: self.email)
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
                    }
                    
                    //                Phone field
                    VStack {
                        TextField("Phone", text: $phone, onEditingChanged: { isEditing in
                            if !isEditing {
                                self.isPhoneValid = PhoneValidation.isValidPhone(phone: phone)
                                self.isPhoneEmpty = phone.isEmpty
                            }
                        })
                        .font(.custom(Fonts.medium.rawValue, size: deviceWidth*(14/baseWidth)))
                        .keyboardType(.phonePad)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("borderColor"), lineWidth: 0.75)
                        )
                        if !isPhoneEmpty && !isPhoneValid {
                            HStack {
                                Text("Phone number not valid")
                                    .font(.caption2)
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                    
                    
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
                    
                    HStack {
                        Text("By taping submit & register, you agree to [Terms & Conditions](https://tohfabd.com/terms) and [Policy Policy](https://tohfabd.com/privacy-policy) of Tohfabd.")
                            .font(.custom(Fonts.regular.rawValue, size: deviceWidth*(14/baseWidth)))
                        Spacer()
                    }
                    
                    NavigationLink(destination: HomeScreen(), isActive: $signUpViewModel.navigateToMainView) {
                        Button(action: {
                            if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty && EmailValidator.isValidEmail(email: email) && PasswordValidator.isValidPassword(password: password) && !confirmPassword.isEmpty && password == confirmPassword && PhoneValidation.isValidPhone(phone: phone) == !phone.isEmpty {
                                isFirstNameEmpty = false
                                isLastNameEmpty = false
                                isEmailEmpty = false
                                isPhoneEmpty = false
                                isPasswordEmpty = false
                                isConfirmPasswordEmpty = false
                                isEmailValid = true
                                isPhoneValid = true
                                isPasswordValid = true
                                if phone.isEmpty {
                                    let createSignUpRequest = CreateSignUpRequest(firstname: firstName, lastname: lastName, email: email, password: password)
                                    signUpViewModel.createSignUp(request: createSignUpRequest)
                                } else {
                                    let createSignUpRequest = CreateSignUpRequest(firstname: firstName, lastname: lastName, email: email, phone: phone, password: password)
                                    signUpViewModel.createSignUp(request: createSignUpRequest)
                                }
                                print("Wow... Signup form validation perfect...!!")
                            }
                            else {
                                if !firstName.isEmpty {
                                    isFirstNameEmpty = false
                                    print("isFirstNameEmpty: false")
                                    if !lastName.isEmpty {
                                        isLastNameEmpty = false
                                        print("isLastNameEmpty: false")
                                        if !email.isEmpty {
                                            isEmailEmpty = false
                                            print("isEmailEmpty: false")
                                            if EmailValidator.isValidEmail(email: email) {
                                                isEmailValid = true
                                                print("isEmailValid: true")
                                                if PhoneValidation.isValidPhone(phone: phone) == !phone.isEmpty {
                                                    isPhoneValid = true
                                                    isPhoneEmpty = phone.isEmpty
                                                    print("isPhoneValid: true")
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
                                                } else {
                                                    isPhoneValid = false
                                                    isPhoneEmpty = phone.isEmpty
                                                    print("isPhoneValid: false")
                                                }
                                            } else {
                                                isEmailValid = false
                                                print("isEmailValid: false")
                                            }
                                        } else {
                                            isEmailEmpty = true
                                            print("isEmailEmpty: false")
                                        }
                                    } else {
                                        isLastNameEmpty = true
                                        print("isLastNameEmpty: false")
                                    }
                                } else {
                                    isFirstNameEmpty = true
                                    print("isFirstNameEmpty: true")
                                }
                                print("-------- Checked -------")
                            }
                        }) {
                            Text("Submit & Register")
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
                        LoginLink()
                        Spacer()
                    }
                }
                .padding(.vertical)
                Spacer()
            }
            .alert(isPresented: $signUpViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(signUpViewModel.errorMessage), dismissButton: .default(Text("Ok")))
            }
            .padding(EdgeInsets(top: deviceWidth*(35/baseWidth), leading: deviceWidth*(16/baseWidth), bottom: 0, trailing: deviceWidth*(16/baseWidth)))
            
            if case .LOADING = signUpViewModel.curentState {
                ProgressIndicator()
            }
        }
//        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
