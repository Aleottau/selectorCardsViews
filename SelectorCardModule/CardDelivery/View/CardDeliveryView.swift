//
//  CardDeliveryView.swift
//  SelectorCardModule
//
//  Created by alejandro on 13/02/23.
//

import Foundation
import UIKit
import SnapKit

class CardDeliveryView: UIView {
    var imageView = UIImageView()
    var titleSegment = UILabel()
    var suggestion = UILabel()
    var addressSegment = UILabel()
    var userAdrress = UILabel()
    var paymentDescription = UILabel()
    var numbersCards = UILabel()
    var payButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func makeContraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(500)
        }
        
        
    }
    
    
}
