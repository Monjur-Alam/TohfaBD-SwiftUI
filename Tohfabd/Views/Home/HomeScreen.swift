//
//  HomeScreen.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var isSidebarVisible = false
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if case .LOADING = homeViewModel.curentState {
                    ProgressIndicator()
                } else if case .SUCCESS(let homeDataModel) = homeViewModel.curentState {
                    ZStack {
                        VStack {
                            NavigationBarView(isSidebarVisible: $isSidebarVisible)
                                .padding(.vertical, deviceHeight*(10/baseHeight))
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 0, leading: deviceWidth*(16/baseWidth), bottom: 0, trailing: deviceWidth*(16/baseWidth)))
                        
                        Sidebar(category: homeDataModel?.category, isSidebarVisible: $isSidebarVisible)
                    }
                } else if case .FAILURE(let error) = homeViewModel.curentState {
                    VStack(alignment: .center) {
                        Spacer()
                        Text(error)
                            .font(.headline.bold())
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding()
                }
                //            .alert(isPresented: false) {
                //                Alert(title: Text("Error"), message: Text(""), dismissButton: .default(Text("Ok")))
                //            }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
