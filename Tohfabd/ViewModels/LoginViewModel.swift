//
//  LoginViewModel.swift
//  Tohfabd
//
//  Created by MacBook Pro on 4/1/23.
//

import Foundation
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    enum LoginViewState {
        case START
        case LOADING
        case SUCCESS(createLoginResponse: CreateLoginResponse)
        case FAILURE(error: String)
    }
    
    @Published var curentState: LoginViewState = .START
    @Published var errorMessage: String = ""
    @Published var navigateToMainView: Bool = false
    @Published var showAlert: Bool = false
    @Published var createLoginResponse: CreateLoginResponse?
    
    func createLogin(request: CreateLoginRequest) {
        self.curentState = .LOADING
        APIServices.shared.callCreateLogin(parameters: request.dictionary ?? [:], success: { response in
            if let response = response {
                self.curentState = .SUCCESS(createLoginResponse: response)
                self.createLoginResponse = response
                self.navigateToMainView = response.success ?? false
                self.errorMessage = response.message ?? ""
                self.showAlert = !self.navigateToMainView
            }
            
        }) {(errorMessage: String) in
            self.curentState = .FAILURE(error: errorMessage)
            self.errorMessage = errorMessage
            self.showAlert = true
            print("errorMessage: -> \(errorMessage)")
        }
    }
}
