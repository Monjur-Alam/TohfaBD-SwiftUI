//
//  Constants.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//	

import Foundation
import UIKit

struct Constants {
    static let BASE_URL = "https://iosapi.parcelmagic.com/api/v1.0/" // OMDBAPI
    static let BASE_HEIGHT: Double = 992
    static let BASE_WIDTH: Double = 430
}

var deviceWidth:CGFloat{
    return UIScreen.main.bounds.width
}

var deviceHeight:CGFloat{
    return UIScreen.main.bounds.height
}

var baseWidth:CGFloat{
    return 430
}

var baseHeight:CGFloat{
    return 992
}

struct AppConstants {
    static let serverURL: String = "http://3.75.170.153"

    enum URL {
        static let apiLogin: String = "/api/login"
        static let apiSignUp: String = "/api/register"
        static let apiSendEmail: String = "/api/forgot-password-send-mail"
        static let apiVreify: String = "/api/forgot-password-verified"
        static let apiResetPassword: String = "/api/forgot-password-change"
    }
}
