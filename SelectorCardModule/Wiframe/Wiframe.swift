//
//  Router.swift
//  SelectorCardModule
//
//  Created by alejandro on 1/02/23.
//

import Foundation
import UIKit

class Wiframe {
    
    var navigation: UINavigationController
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func showBaseController(with prensenter: Presenter) -> UIViewController {
        let ViewController = ViewController(presenter: prensenter)
        navigation.setViewControllers([ViewController], animated: false)
        return navigation
    }
}
