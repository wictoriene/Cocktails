//
//  CocktailList.swift
//  Cocktail
//
//  Created by wictoriene on 21.05.22.
//

import UIKit

class CocktailList: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "kCocktailList"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = ""
        
    }
    
}
