//
//  UiView+Extension.swift
//  SelectorCardModule
//
//  Created by alejandro on 8/02/23.
//

import UIKit

extension UIView {
    func transformToLargeSize() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    func transformToStandardSize() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
        }
    }
}
