//
//  CategoriesVC.swift
//  Cocktail
//
//  Created by wictoriene on 2.03.22.
//

protocol ReloadCtegories {
    func reloadCategories(indexPath:Int)
}

import UIKit
import Firebase


  class CategoriesVC: UIViewController {
    
     @IBOutlet private weak var appLogo: UIImageView!
     @IBOutlet private weak var categoriesCollection: UICollectionView!
     @IBOutlet private weak var appDescriptionLabel: UILabel!
      
      var reloadCategoriesDelegate: ReloadCtegories?
      
      var categoriesData:[CategoryModel]=[
        CategoryModel(image: UIImageView(image: UIImage(named: "floral")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "bitter")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "mint")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "vegetable")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "berry")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "sour")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "choc")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "classic")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "spicy")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "dry")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "coffee")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "herbal")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "tropic")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "sweet")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "creamy")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "salty")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "citrus")!)),
        CategoryModel(image: UIImageView(image: UIImage(named: "fruit")!))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesCollection.dataSource = self
        categoriesCollection.delegate = self
        appDescriptionLabel.text = "По-настоящему важные" + " дела обсуждаются во" + " время коктейля."
        
        categoriesCollection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: CategoryCell.identifier)
    
    }
          
}

//MARK: - CategoriesVC extension

extension CategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoriesEnum.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.image.image = categoriesData[indexPath.row].image.image
        cell.title.text = CategoriesEnum.allCases[indexPath.row].categoriesName
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CocktailsListVC(nibName: String(describing: CocktailsListVC.self), bundle: nil)
        vc.categoryEnum = CategoriesEnum.allCases[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Double(UIScreen.main.bounds.width)/2.9, height:  Double(UIScreen.main.bounds.width)/2.4)
    }
}
