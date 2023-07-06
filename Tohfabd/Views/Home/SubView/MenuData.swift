//
//  MenuData.swift
//  Tohfabd
//
//  Created by MacBook Pro on 16/1/23.
//

import SwiftUI

struct MenuData: View {
    var category: [Category]?

    var body: some View {
        List(category!, children: \.subcategory) { row in
            HStack {
//                Image(systemName: row.icon)
                Text(row.name ?? "")
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MenuData_Previews: PreviewProvider {
    static var previews: some View {
        let items: [Category] = [.category1, .category2]
        return MenuData(category: items)
    }
}
