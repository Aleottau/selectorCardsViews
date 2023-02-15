//
//  Presenter.swift
//  SelectorCardModule
//
//  Created by alejandro on 31/01/23.
//

import Foundation
import UIKit

class Presenter {

    var wiframe: Wiframe
    init(wiframe: Wiframe) {
        self.wiframe = wiframe
    }
    func setUpInitial(windowScene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = wiframe.showBaseController(with: self)
        window.makeKeyAndVisible()
        return window
    }
}
