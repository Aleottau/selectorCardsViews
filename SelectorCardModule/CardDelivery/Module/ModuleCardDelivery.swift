//
//  ModuleCardDelivery.swift
//  SelectorCardModule
//
//  Created by alejandro on 13/02/23.
//

import Foundation
import UIKit

final class ModuleCardDelivery {
    
    private let presenter: CardDeliveryPresenterProtocol
    
    init(with baseController: UIViewController) {
        let wiframe = CardDeliveryWiframe(controller: baseController)
        presenter = CardDeliveryPresenter(wiframe: wiframe)
    }
    
    func showCardDelivery() {
        presenter.showCardDelivery()
    }
}
