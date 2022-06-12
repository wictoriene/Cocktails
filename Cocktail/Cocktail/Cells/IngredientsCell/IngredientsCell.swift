//
//  IngredientsCell.swift
//  Cocktail
//
//  Created by wictoriene on 25.05.22.
//

import UIKit

class IngredientsCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var ingredientImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var size: UILabel!
    
    static let identifier = "kIngredientsCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.backgroundColor = .clear
    }

}
