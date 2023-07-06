//
//  Utils.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import Foundation

enum Fonts: String {
    case regular = "Poppins-Regular"
    case italic = "Poppins-Italic"
    case medium = "Poppins-Medium"
    case semiBold = "Poppins-SemiBold"
    case mediumItalic = "Poppins-MediumItalic"
    case bold = "Poppins-Bold"
    case boldItalic = "Poppins-BoldItalic"
    case extraBold = "Poppins-ExtraBold"
    case extraBoldItalic = "Poppins-ExtraBoldItalic"
    case light = "Poppins-Light"
    case lightItalic = "Poppins-LightItalic"
    case extraLight = "Poppins-ExtraLight"
    case extraLightItalic = "Poppins-ExtraLightItalic"
    case thin = "Poppins-Thin"
    case thinItalic = "Poppins-ThinItalic"
}

struct EmailValidator {
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct PasswordValidator {
    static func isValidPassword(password: String) -> Bool {
        return password.count >= 6
    }
}

struct PhoneValidation {
    static func isValidPhone(phone: String) -> Bool {
//        let phoneRegex = "^(?:(?:\\+|0{0,2})88)?(?:[13456789][0-9]|(?:2[2-9]|3[1-2]|4[5-7]|5[0-8]|6[5-7]|7[1-9]|8[1-9]|9[0-9])[0-9])[0-9]{6}$"
//        let phoneRegex = "(?:(?:\\+|00)88|01)?\\d{11}"  // for BD phone number
//        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
//        let result = phoneTest.evaluate(with: phone)
        return !phone.isEmpty
    }
}
