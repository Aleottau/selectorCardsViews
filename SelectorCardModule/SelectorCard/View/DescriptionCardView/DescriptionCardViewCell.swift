//
//  DescriptionCardViewCell.swift
//  SelectorCardModule
//
//  Created by alejandro on 9/02/23.
//

import UIKit

class DescriptionCardViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier: String = "DescriptionCardViewCell"
    override var reuseIdentifier: String? {
        return DescriptionCardViewCell.identifier
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = nil
    }
    func setModel(description: String) {
        descriptionLabel.text = description
    }

}
