//
//  SplashScreen.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color("white").ignoresSafeArea(.all, edges: .all)
            VStack {
                Image(uiImage: UIImage(named: "logo")!)
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
