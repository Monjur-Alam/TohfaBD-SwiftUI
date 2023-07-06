//
//  VerifyCodeViewModel.swift
//  Tohfabd
//
//  Created by MacBook Pro on 15/1/23.
//

import SwiftUI

class VerifyCodeViewModel: ObservableObject {
    enum VerifyCodeViewState {
        case START
        case LOADING
        case SUCCESS(response: VerifyCodeResponse)
        case FAILURE(error: String)
    }
    @Published var curentState: VerifyCodeViewState = .START
    @Published var errorMessage: String = ""
    @Published var navigateToResetPasswordView: Bool = false
    @Published var showAlert: Bool = false
    @Published var response: VerifyCodeResponse?
    
    func verifyCodeRequest(request: VerifyCodeRequest) {
        self.curentState = .LOADING
        APIServices.shared.verifyCodeRequest(parameters: request.dictionary ?? [:], success: { response in
            if let response = response {
                self.curentState = .SUCCESS(response: response)
                self.response = response
                self.navigateToResetPasswordView = response.success ?? false
                self.showAlert = !self.navigateToResetPasswordView
                self.errorMessage = response.message ?? ""
                print(response)
            }
            
        }) {(errorMessage: String) in
            self.curentState = .FAILURE(error: errorMessage)
            self.errorMessage = errorMessage
            self.showAlert = true
            print("errorMessage: -> \(errorMessage)")
        }
    }
}
