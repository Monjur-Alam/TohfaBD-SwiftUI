//
//  ContentView.swift
//  Tohfabd
//
//  Created by MacBook Pro on 28/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var splashScreen  = true
    var body: some View {
        ZStack{
            Group{
                if splashScreen {
                    SplashScreen()
                }
                else{
                    HomeScreen()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline:.now() + 1) {
                    self.splashScreen = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
