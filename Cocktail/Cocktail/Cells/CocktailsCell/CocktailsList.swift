//
//  CocktailsList.swift
//  Cocktail
//
//  Created by wictoriene on 23.03.22.
//

import UIKit

class CocktailsList: UITableViewCell {
    
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var description1: UILabel!
    
    static let identifier = "kCocktailsList"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

  
    }
    
}
