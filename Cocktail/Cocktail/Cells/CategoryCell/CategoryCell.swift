//
//  CategoryCell.swift
//  Cocktail
//
//  Created by wictoriene on 19.03.22.
//

protocol UpdateChooseCategory {
    func choosenCategory(tag:Int)
}

import UIKit
import Moya

class CategoryCell: UICollectionViewCell {
    
    var categoryButton = UIButton()
    
    weak var image: UIImage!
    var title: String!
    var choosenCategoryCellDelegate: UpdateChooseCategory?
    
    @IBOutlet weak var view: UIView!
    static let identifier = "kCategoryCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 10
        view.contentMode = .scaleAspectFit

    }
    
    func update(for categoryModel: CategoryModel) {
        image = categoryModel.image
        title = categoryModel.title
    }
    
    func configureButton(){
        categoryButton.configuration = .filled()
        categoryButton.configuration?.cornerStyle = .small
        categoryButton.configuration?.baseForegroundColor = .tertiarySystemGroupedBackground
        categoryButton.configuration?.imagePlacement = .leading
        categoryButton.configuration?.imagePadding = 10.0
        categoryButton.configuration?.image = image
        categoryButton.configuration?.title = title
        categoryButton.addTarget(self, action: #selector(chooseButtonAction), for:.touchUpInside)
        addButtonConstrains()

    }
    
    func addButtonConstrains(){
//        view.contentMode = .scaleAspectFill
        view.addSubview(categoryButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        categoryButton.layer.cornerRadius = 10
        
        
        NSLayoutConstraint.activate([
            categoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            categoryButton.widthAnchor.constraint(equalToConstant: 250),
            categoryButton.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    @objc func chooseButtonAction(sender: UIButton){
        choosenCategoryCellDelegate?.choosenCategory(tag: tag)
    }


}

