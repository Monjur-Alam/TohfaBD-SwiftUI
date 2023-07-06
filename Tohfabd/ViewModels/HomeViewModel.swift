//
//  HomeViewModel.swift
//  Tohfabd
//
//  Created by MacBook Pro on 16/1/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    enum HomeViewState {
        case START
        case LOADING
        case SUCCESS(response: HomeDataModel?)
        case FAILURE(error: String)
    }
    
    @Published var curentState: HomeViewState = .START
    @Published var response: HomeDataModel?
    
    init() {
        getHomeData()
    }
    
    func getHomeData() {
        curentState = .LOADING
        if let url = Bundle.main.url(forResource: "home", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                response = try decoder.decode(HomeDataModel.self, from: jsonData)
                curentState = .SUCCESS(response: response)
            } catch {
                curentState = .FAILURE(error: "Something went wrong!")
                print(error)
            }
        } else {
            curentState = .FAILURE(error: "Something went wrong")
        }
    }
}
