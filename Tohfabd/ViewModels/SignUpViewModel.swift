//
//  SignUpViewModel.swift
//  Tohfabd
//
//  Created by MacBook Pro on 4/1/23.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    enum SignUpViewState {
        case START
        case LOADING
        case SUCCESS(createSignUpResponse: CreateSignUpResponse)
        case FAILURE(error: String)
    }
    @Published var curentState: SignUpViewState = .START
    @Published var errorMessage: String = ""
    @Published var navigateToMainView: Bool = false
    @Published var showAlert: Bool = false
    @Published var createSignUpResponse: CreateSignUpResponse?
    
    func createSignUp(request: CreateSignUpRequest) {
        self.curentState = .LOADING
        APIServices.shared.callCreateSignUp(parameters: request.dictionary ?? [:], success: { response in
            if let response = response {
                self.curentState = .SUCCESS(createSignUpResponse: response)
                self.createSignUpResponse = response
                self.navigateToMainView = response.success ?? false
                self.showAlert = !self.navigateToMainView
                self.errorMessage = response.message ?? ""
                print(self.errorMessage)
            }
            
        }) {(errorMessage: String) in
            self.curentState = .FAILURE(error: errorMessage)
            self.errorMessage = errorMessage
            self.showAlert = true
            print("errorMessage: -> \(errorMessage)")
        }
    }
}
