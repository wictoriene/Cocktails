//
//  CocktailsListVC.swift
//  Cocktail
//
//  Created by wictoriene on 20.03.22.
//

import UIKit
import Firebase
import SDWebImage

class CocktailsListVC: UIViewController {
    
    @IBOutlet private weak var chosenCategory: UILabel!
    @IBOutlet private weak var cocktailsList: UICollectionView!
    
    var dataSource:[DataSnapshot] = []
    var choosenCocktail = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.getrealmTime { result in
            self.dataSource.append(result!)
        }
        
        cocktailsList.dataSource = self
        cocktailsList.delegate = self
        cocktailsList.register(UINib(nibName: "CocktailsCell", bundle: nil), forCellWithReuseIdentifier: CocktailsCell.identifier)

        
    }
    
   
}

//MARK: exstension CocktailsListVC

extension CocktailsListVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cocktailsList.dequeueReusableCell(withReuseIdentifier: CocktailsCell.identifier, for: indexPath) as! CocktailsCell
        
        return cell
    }
       
}
