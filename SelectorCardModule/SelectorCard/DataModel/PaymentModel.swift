//
//  PaymentModel.swift
//  SelectorCardModule
//
//  Created by alejandro on 6/02/23.
//

import Foundation

struct PaymentModel: Codable, Hashable {
    let title: String
    let cardLastFour: String
    let cardIcon: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case cardLastFour = "card_last_four"
        case cardIcon = "card_icon"
    }
}
