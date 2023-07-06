//
//  CreateSignUpResponse.swift
//  Tohfabd
//
//  Created by MacBook Pro on 4/1/23.
//

import Foundation

struct CreateSignUpResponse: Codable {
    var status: Int?
    var success: Bool?
    var token: String?
    var message: String?
}
