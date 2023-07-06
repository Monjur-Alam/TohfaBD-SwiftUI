//
//  SendEmailViewModel.swift
//  Tohfabd
//
//  Created by MacBook Pro on 10/1/23.
//

import SwiftUI

class SendEmailViewModel: ObservableObject {
    enum SendEmailViewState {
        case START
        case LOADING
        case SUCCESS(response: SendEmailResponse)
        case FAILURE(error: String)
    }
    @Published var curentState: SendEmailViewState = .START
    @Published var errorMessage: String = ""
    @Published var navigateToVerificarionView: Bool = false
    @Published var showAlert: Bool = false
    @Published var response: SendEmailResponse?
    
    func sendEmailRequest(request: SendEmailRequest) {
        self.curentState = .LOADING
        APIServices.shared.sendEmailRequest(parameters: request.dictionary ?? [:], success: { response in
            if let response = response {
                self.curentState = .SUCCESS(response: response)
                self.response = response
                self.navigateToVerificarionView = response.success ?? false
                self.showAlert = !self.navigateToVerificarionView
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
