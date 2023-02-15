//
//  CardDeliveryWiframe.swift
//  SelectorCardModule
//
//  Created by alejandro on 13/02/23.
//

import Foundation
import UIKit

class CardDeliveryWiframe {
    
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showCardDelivery(presenter: CardDeliveryPresenterProtocol) {
        let viewController = CardDeliveryController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen
        controller.present(viewController, animated: false)
    }
}

