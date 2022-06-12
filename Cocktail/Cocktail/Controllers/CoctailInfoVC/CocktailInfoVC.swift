//
//  CocktailInfoVC.swift
//  Cocktail
//
//  Created by wictoriene on 21.03.22.
//

import UIKit
import Firebase
import SDWebImage


class CocktailInfoVC: UIViewController {
    
    @IBOutlet weak var cocktailTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ingredientCollection: UICollectionView!
    
    var dataSource:[IngredientsModel] = []{
        didSet{
            ingredientCollection.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientCollection.dataSource = self
        ingredientCollection.delegate = self
        
        ingredientCollection.register(UINib(nibName: "IngredientsCell", bundle: nil), forCellWithReuseIdentifier: IngredientsCell.identifier)
        
        getrealmTime()
        


    }
    @IBAction func cookButton(_ sender: Any) {
        let vc = CocktailStepsVC(nibName: String(describing: CocktailStepsVC.self), bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getrealmTime(){
        var ref: DatabaseReference!
        ref = Database.database().reference()

        ApiManager.shared.getrealmTime { snapshot in
            if let array = snapshot?.value as? [[String:Any]]{
                for aValue in array {
                    let ingredients = aValue["ingredients"] as? String ?? "noingredientss"
                    let id = aValue["id"] as? String ?? "noid"
                    let title = aValue["title"] as? String ?? "notitle"
                    let imagePath = aValue["imagePath"] as? String ?? "noimagePath"
                    let volume = aValue["volume"] as? String ?? "novolume"
    
                    let ingredient = IngredientsModel(ingredients: ingredients, id: id, imagePath: imagePath, title: title, volume: volume)
                    self.dataSource.append(ingredient)
                }
            }
        }
    }
    
}

extension CocktailInfoVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCell.identifier, for: indexPath) as! IngredientsCell
        cell.size.text = dataSource[indexPath.row].volume
        return cell
    }
    
}

extension CocktailInfoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: Int(UIScreen.main.bounds.width) - 10, height:  Int(UIScreen.main.bounds.width / 4))
    }
}
