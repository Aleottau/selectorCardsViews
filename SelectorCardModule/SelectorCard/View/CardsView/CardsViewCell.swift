//
//  CardsViewCell.swift
//  SelectorCardModule
//
//  Created by alejandro on 2/02/23.
//

import UIKit

class CardsViewCell: UICollectionViewCell {
    
    var isFlip = false
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var titleCardLabel: UILabel!
    @IBOutlet weak var priceCardLabel: UILabel!
    
    @IBAction func buttonFlipAction(_ sender: UIButton) {
        if isFlip {
            isFlip = false
            cardImage.image = UIImage(named: "cardFront")
            UIView.transition(with: cardImage, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            isFlip = true
            cardImage.image = UIImage(named: "cardBack")
            UIView.transition(with: cardImage, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
    static let identifier: String = "CardsViewCell"
    override var reuseIdentifier: String? {
        return CardsViewCell.identifier
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        titleCardLabel.text = nil
        priceCardLabel.text = nil
        cardImage.image = nil
        isFlip = false
    }
    func setModel(productData: ProductsModel) {
        titleCardLabel.text = productData.title
        priceCardLabel.text = productData.replacementCost
        cardImage.image = UIImage(named: "cardFront")
    }
}
