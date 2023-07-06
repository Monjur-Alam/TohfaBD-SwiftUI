//
//  CanevasSize.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import SwiftUI

struct CanevasSize: View {
    var height = UIScreen.main.bounds.height
    var wight = UIScreen.main.bounds.width
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Height: \(height)")
                Spacer()
                Text("Wight: \(wight)")
            }
            Spacer()
        }
        .background(Color(.red))
    }
}

struct CanevasSize_Previews: PreviewProvider {
    static var previews: some View {
        CanevasSize()
    }
}
