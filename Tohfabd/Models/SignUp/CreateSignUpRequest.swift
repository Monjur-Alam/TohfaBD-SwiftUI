//
//  CreateSignUpRequest.swift
//  Tohfabd
//
//  Created by MacBook Pro on 4/1/23.
//

import Foundation

struct CreateSignUpRequest: Codable {
    var firstname: String?
    var lastname: String?
    var email: String?
    var phone: String?
    var password: String?
}
