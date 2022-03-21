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
      
//      var data:[DataSnapshot] = [] {
//          didSet{
//              print(data)
//          }
//      }
    
     @IBOutlet private weak var appLogo: UIImageView!
     @IBOutlet private weak var categoriesCollection: UICollectionView!
     @IBOutlet private weak var appDescriptionLabel: UILabel!
     @IBOutlet private weak var barButton: UIButton!
      
      var reloadCategoriesDelegate: ReloadCtegories?
      var choosenCategory = 0
      
      var categoriesData:[CategoryModel]=[
        CategoryModel(image: UIImage(named: "classic")!, title: ""),
        CategoryModel(image: UIImage(named: "mocktail")!, title:""),
        CategoryModel(image: UIImage(named: "short")!, title: ""),
        CategoryModel(image: UIImage(named: "shots")!, title: ""),
        CategoryModel(image: UIImage(named: "twist")!, title: ""),
        CategoryModel(image: UIImage(named: "hot")!, title:""),
        CategoryModel(image: UIImage(named: "long")!, title: "")]
      

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
        let cell = categoriesCollection.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.update(for: categoriesData[indexPath.row])
        cell.configureButton()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = categoriesCollection.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.categoryButton.tag = indexPath.row
        if indexPath.row == choosenCategory{
            let vc = CocktailsListVC()
            navigationController?.pushViewController(vc, animated: true)
            print("tap")
        }
        cell.choosenCategoryCellDelegate = self
  
    }
    
}

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension CategoriesVC: UpdateChooseCategory {
    func choosenCategory(tag: Int) {
        choosenCategory = tag
        categoriesCollection.reloadData()
        reloadCategoriesDelegate?.reloadCategories(indexPath: tag)
        
    }
}


