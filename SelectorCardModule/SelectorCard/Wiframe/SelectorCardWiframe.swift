//
//  SelectorCardWiframe.swift
//  SelectorCardModule
//
//  Created by alejandro on 2/02/23.
//

import Foundation
import UIKit

class SelectorCardWiframe {
    
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showSelector(presenter: SelectorCardPresenterProtocol) {
        let viewController = SelectorCardController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen
        controller.present(viewController, animated: false)
    }
}
