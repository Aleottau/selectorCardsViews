//
//  SelectorCardPresenter.swift
//  SelectorCardModule
//
//  Created by alejandro on 2/02/23.
//

import Foundation
import UIKit

protocol SelectorCardPresenterProtocol {
    func showSelectorCard()
}

class SelectorCardPresenter  {
    
    let wiframe: SelectorCardWiframe
    init(wiframe: SelectorCardWiframe) {
        self.wiframe = wiframe
    }
}
extension SelectorCardPresenter: SelectorCardPresenterProtocol {
    func showSelectorCard() {
        wiframe.showSelector(presenter: self)
    }
    
    
}
