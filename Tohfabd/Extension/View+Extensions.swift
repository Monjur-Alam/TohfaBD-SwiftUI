//
//  View+Extensions.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}

extension UIViewController {
    func ppHeight(height: Double) -> Double {
        return deviceHeight * (height/baseHeight)
    }
}

extension Double {
    func ppWidth(width: Double) -> Double {
        return deviceWidth * (width/baseWidth)
    }
}

extension View {
    func ProgressIndicator() -> some View {
        ZStack {
            Color.black.opacity(0.05)
                .ignoresSafeArea()
            ProgressView()
                .scaleEffect(2, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        }
    }
}

