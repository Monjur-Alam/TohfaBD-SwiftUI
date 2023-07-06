//
//  ProductPage.swift
//  Tohfabd
//
//  Created by MacBook Pro on 16/1/23.
//

import SwiftUI

struct ProductPage: View {
    var name: String?
    var body: some View {
        Text(name ?? "")
    }
}

struct ProductPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage(name: "Product")
    }
}
