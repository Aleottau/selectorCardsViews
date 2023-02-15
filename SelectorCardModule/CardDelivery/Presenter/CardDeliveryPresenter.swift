//
//  CardDeliveryPresenter.swift
//  SelectorCardModule
//
//  Created by alejandro on 13/02/23.
//

import Foundation
import UIKit

protocol CardDeliveryPresenterProtocol {
    func showCardDelivery()
}

class CardDeliveryPresenter  {
    let wiframe: CardDeliveryWiframe
    init(wiframe: CardDeliveryWiframe) {
        self.wiframe = wiframe
    }
}
extension CardDeliveryPresenter: CardDeliveryPresenterProtocol {
    func showCardDelivery() {
        wiframe.showCardDelivery(presenter: self)
    }

}
