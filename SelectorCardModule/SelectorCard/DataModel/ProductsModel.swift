//
//  ProductsModel.swift
//  SelectorCardModule
//
//  Created by alejandro on 6/02/23.
//

import Foundation

struct ProductsModel: Codable, Hashable {
    let id: Int
    let title: String
    let frontImage: String
    let backImage: String
    let description: String
    let replacementCost: String
    let tag: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case frontImage = "front_image"
        case backImage = "back_image"
        case description
        case replacementCost = "replacement_cost"
        case tag
    }
}
