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
     @IBOutlet private weak var barButton: UIButton!
      
      var reloadCategoriesDelegate: ReloadCtegories?
      
      var categoriesData:[CategoryModel]=[
        CategoryModel(image: UIImageView(image: UIImage(named: "classic")!), title: "Classic"),
        CategoryModel(image: UIImageView(image: UIImage(named: "hot")!), title: "Hot"),
        CategoryModel(image: UIImageView(image: UIImage(named: "long")!), title: "Long"),
        CategoryModel(image: UIImageView(image: UIImage(named: "mocktail")!), title: "mocktail"),
        CategoryModel(image: UIImageView(image: UIImage(named: "saur")!), title: "saur"),
        CategoryModel(image: UIImageView(image: UIImage(named: "shots")!), title: "shots"),
        CategoryModel(image: UIImageView(image: UIImage(named: "short")!), title: "short"),
        CategoryModel(image: UIImageView(image: UIImage(named: "deserts")!), title: "deserts")]
      

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ApiManager.shared.getrealmTime{ result in
//            self.data.append(result!)}
        
        categoriesCollection.dataSource = self
        categoriesCollection.delegate = self
        appDescriptionLabel.text = "По-настоящему важные" + " дела обсуждаются во" + " время коктейля."
        
        categoriesCollection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: CategoryCell.identifier)
    
    }
    
      @IBAction func barButtonAction(_ sender: Any) {
          
      }
      
}

//MARK: - CategoriesVC extension

extension CategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.image.image = categoriesData[indexPath.row].image.image
        cell.title.text = categoriesData[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CocktailsListVC(nibName: String(describing: CocktailsListVC.self), bundle: nil)
        vc.choosenCategoryText = categoriesData[indexPath.row].title
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}


