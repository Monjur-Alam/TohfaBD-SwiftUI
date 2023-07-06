//
//  VerifyCodeRequest.swift
//  Tohfabd
//
//  Created by MacBook Pro on 15/1/23.
//

import Foundation

struct VerifyCodeRequest: Codable {
    var email: String?
    var code: String?
}
