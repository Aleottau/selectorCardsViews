//
//  ModuleCardSelector.swift
//  SelectorCardModule
//
//  Created by alejandro on 1/02/23.
//

import Foundation
import UIKit

final class ModuleSelectorCard {
    
    private let presenter: SelectorCardPresenter
    
    init(with baseController: UIViewController) {
        let wiframe = SelectorCardWiframe(controller: baseController)
        presenter = SelectorCardPresenter(wiframe: wiframe)
    }
    
    func showSelectorCard() {
        presenter.showSelectorCard()
    }
}
