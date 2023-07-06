//
//  HomeDataModel.swift
//  Tohfabd
//
//  Created by MacBook Pro on 16/1/23.
//

struct HomeDataModel: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let category: [Category]?
}

struct Category: Codable, Identifiable {
    let id: Int?
    let name: String?
    let image: String?
    let subcategory: [Category]?
    
    static let category1 = Category(id: 1, name: "Cat 1", image: "", subcategory: [Category(id: 1, name: "Sub 1", image: "", subcategory: nil)])
    static let category2 = Category(id: 2, name: "Cat 2", image: "", subcategory: [Category(id: 1, name: "Sub 2", image: "", subcategory: nil)])
}
