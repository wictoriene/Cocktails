//
//  CategoriesVC.swift
//  Cocktail
//
//  Created by wictoriene on 2.03.22.
//

import UIKit

  class CategoriesVC: UIViewController {
    
     @IBOutlet private weak var appLogo: UIImageView!
     @IBOutlet private weak var categoriesCollection: UICollectionView!
     @IBOutlet private weak var appDescriptionLabel: UILabel!
     @IBOutlet private weak var barButton: UIButton!
      
      var categoriesData:[CategoryModel]=[CategoryModel(image: UIImage(named: "classic")!, title: ""),
                                       CategoryModel(image: UIImage(named: "deserts")!, title: ""),
                                       CategoryModel(image: UIImage(named: "long")!, title: ""),
                                       CategoryModel(image: UIImage(named: "mocktail")!, title: ""),
                                       CategoryModel(image: UIImage(named: "twist")!, title: ""),
                                       CategoryModel(image: UIImage(named: "hot")!, title: ""),]
      

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesCollection.dataSource = self
        categoriesCollection.delegate = self
        appDescriptionLabel.text = "По-настоящему важные дела обсуждаются во время коктейля."
        
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
}


