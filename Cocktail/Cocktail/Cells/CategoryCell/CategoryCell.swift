//
//  CategoryCell.swift
//  Cocktail
//
//  Created by wictoriene on 19.03.22.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    let categoryButton = UIButton()
    weak var image: UIImage!
    var title: String!
    
    @IBOutlet weak var view: UIView!
    static let identifier = "kCategoryCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //configureButton()
        
    }
    
    func update(for categoryModel: CategoryModel) {
        image = categoryModel.image
        title = categoryModel.title
    }
    
    func configureButton(){
        categoryButton.configuration = .filled()
        categoryButton.configuration?.cornerStyle = .small
        categoryButton.configuration?.baseForegroundColor = .tertiarySystemGroupedBackground
        categoryButton.configuration?.imagePlacement = .top
        categoryButton.configuration?.imagePadding = 20.0
        categoryButton.configuration?.image = image
        categoryButton.configuration?.title = title
        addButtonConstrains()
        
    }
    
    func addButtonConstrains(){
        view.addSubview(categoryButton)
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            categoryButton.widthAnchor.constraint(equalToConstant: 250),
            categoryButton.heightAnchor.constraint(equalToConstant: 250)
        ])
    }

}

