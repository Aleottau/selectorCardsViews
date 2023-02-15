//
//  ViewController.swift
//  SelectorCardModule
//
//  Created by alejandro on 31/01/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var selectorCardModule = ModuleSelectorCard(with: self)
    lazy var cardDeliveryModule = ModuleCardDelivery(with: self)
    var presenter: Presenter
    
    init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
//        selectorCardModule.showSelectorCard()
        cardDeliveryModule.showCardDelivery()
    }



}

