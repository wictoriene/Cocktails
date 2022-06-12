//
//  CategoryCell.swift
//  Cocktail
//
//  Created by wictoriene on 19.03.22.
//

import UIKit
import Moya

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backView: UIView!
    
    var categoryModel: CategoryModel?
    static let identifier = "kCategoryCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.backgroundColor = .tertiarySystemGroupedBackground
        backView.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFit
    
    }
    
    func update(for categoryModel: CategoryModel) {
        image = categoryModel.image
    }
}

