//
//  Sidebar.swift
//  Tohfabd
//
//  Created by MacBook Pro on 16/1/23.
//

import SwiftUI

struct Sidebar: View {
    var category: [Category]?
    @Binding var isSidebarVisible: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                MenuChevron
                //                MenuData(category: category)
                menu
            }
            .frame(width: deviceWidth*0.8)
            .offset(x: isSidebarVisible ? 0 : -deviceWidth*0.8)
            .animation(.default, value: isSidebarVisible)
            Spacer()
        }
    }
    
    var MenuChevron: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.white)
                .frame(width: 60, height: 60)
                .offset(x: -40)
                .onTapGesture {
                    isSidebarVisible.toggle()
                }
            
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(Color("PrimaryColor"))
                .offset(x: -30)
        }
        .offset(x: deviceWidth / 2, y: 0)
        .animation(.default, value: isSidebarVisible)
        .opacity(isSidebarVisible ? 1 : 0)
        .animation(.easeInOut.delay(0.1), value: isSidebarVisible)
    }
    
    var menu: some View {
        List(category!, children: \.subcategory) { row in
            NavigationLink(
                destination: ProductPage(name: row.name ?? ""),
                label: {
                    HStack {
                        Text(row.name ?? "")
                            .font(.subheadline)
                    }
                }
            )
        }
        .foregroundColor(Color("PrimaryColor"))
        .listStyle(.plain)
        .cornerRadius(0)
    }
}

// MARK: - Preview
struct Sidebar_Preview: PreviewProvider {
    static var previews: some View {
        let items: [Category] = [.category1, .category2]
        return Sidebar(category: items, isSidebarVisible: .constant(true))
    }
}
