//
//  ResetPasswordViewModel.swift
//  Tohfabd
//
//  Created by MacBook Pro on 15/1/23.
//

import SwiftUI

class ResetPasswordViewModel: ObservableObject {
    enum ResetPasswordViewState {
        case START
        case LOADING
        case SUCCESS(response: ResetPasswordResponse)
        case FAILURE(error: String)
    }
    @Published var curentState: ResetPasswordViewState = .START
    @Published var errorMessage: String = ""
    @Published var navigateToLoginView: Bool = false
    @Published var showAlert: Bool = false
    @Published var response: ResetPasswordResponse?
    
    func resetPasswordRequest(request: ResetPasswordRequest) {
        self.curentState = .LOADING
        APIServices.shared.resetPasswordRequest(parameters: request.dictionary ?? [:], success: { response in
            if let response = response {
                self.curentState = .SUCCESS(response: response)
                self.response = response
                self.navigateToLoginView = response.success ?? false
                self.showAlert = !self.navigateToLoginView
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
