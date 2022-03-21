//
//  CocktailsCell.swift
//  Cocktail
//
//  Created by wictoriene on 20.03.22.
//

import UIKit

class CocktailsCell: UICollectionViewCell {
    @IBOutlet weak var cocktailBackView: UIView!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var cocktailTitle: UILabel!
    @IBOutlet weak var cocktailDescription: UILabel!
    
    static let identifier = "kCockatailsCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizeBackView()
        
    }
    
    func customizeBackView(){
        cocktailBackView.layer.cornerRadius = 10
        cocktailBackView.layer.shadowColor = UIColor.darkGray.cgColor
        cocktailBackView.layer.shadowOffset = .zero
        cocktailBackView.layer.shadowRadius = 10.0
        cocktailBackView.layer.shadowOpacity = 0.5
    }

}
