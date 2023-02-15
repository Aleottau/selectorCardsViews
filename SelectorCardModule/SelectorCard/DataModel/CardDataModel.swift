//
//  CardDataModel.swift
//  SelectorCardModule
//
//  Created by alejandro on 6/02/23.
//

import Foundation

struct CardDataModel: Codable, Hashable {
    let payment: PaymentModel
    let products: [ProductsModel]
    let buttonCopy: String

    enum CodingKeys: String, CodingKey {
        case payment
        case products
        case buttonCopy = "button_copy"
    }
}

