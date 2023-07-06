//
//  APIServices.swift
//  Tohfabd
//
//  Created by MacBook Pro on 4/1/23.
//

import Alamofire
import Foundation

struct APIServices {
    public static let shared = APIServices()

    func callCreateLogin(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: CreateLoginResponse?) -> (), failure: @escaping (_ failureMsg: FailureMessage) -> ()) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        APIManager.shared.callAPI(strURL: AppConstants.URL.apiLogin, queryItems: queryItems, method: .post, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let response = try JSONDecoder().decode(CreateLoginResponse.self, from: data)
                    success(response)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }

    func callCreateSignUp(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: CreateSignUpResponse?) -> (), failure: @escaping (_ failureMsg: FailureMessage) -> ()) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        APIManager.shared.callAPI(strURL: AppConstants.URL.apiSignUp, queryItems: queryItems, method: .post, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let response = try JSONDecoder().decode(CreateSignUpResponse.self, from: data)
                    success(response)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }

    func sendEmailRequest(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: SendEmailResponse?) -> (), failure: @escaping (_ failureMsg: FailureMessage) -> ()) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        APIManager.shared.callAPI(strURL: AppConstants.URL.apiSendEmail, queryItems: queryItems, method: .post, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let response = try JSONDecoder().decode(SendEmailResponse.self, from: data)
                    success(response)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    func verifyCodeRequest(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: VerifyCodeResponse?) -> (), failure: @escaping (_ failureMsg: FailureMessage) -> ()) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        APIManager.shared.callAPI(strURL: AppConstants.URL.apiVreify, queryItems: queryItems, method: .post, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let response = try JSONDecoder().decode(VerifyCodeResponse.self, from: data)
                    success(response)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    func resetPasswordRequest(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: ResetPasswordResponse?) -> (), failure: @escaping (_ failureMsg: FailureMessage) -> ()) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        APIManager.shared.callAPI(strURL: AppConstants.URL.apiResetPassword, queryItems: queryItems, method: .post, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let response = try JSONDecoder().decode(ResetPasswordResponse.self, from: data)
                    success(response)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
}
