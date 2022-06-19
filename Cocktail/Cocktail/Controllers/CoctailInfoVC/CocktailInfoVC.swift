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
    
    var dataSource:[CocktailListModel] = []{
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
    
    private func getrealmTime(){
           var ref: DatabaseReference!
           ref = Database.database().reference()
           
           ApiManager.shared.getrealmTime { snapshot in
               if let array = snapshot?.value as? [[String:Any]]{
                   for aValue in array {
                       let categories = aValue["categories"] as? [String] ?? []
                       let id = aValue["id"] as? String ?? "noid"
                       let title = aValue["title"] as? String ?? "notitle"
                       let description = aValue["description"] as? String ?? "nodescription"
                       let imagePath = aValue["imagePath"] as? String ?? "noimagePath"
                       
                       let ingredientsMap = aValue["ingredients"] as? [[String:Any]] ?? []
                       let ingredients = ingredientsMap.map { (ingredient) -> IngredientModel in
                           let id = ingredient["id"] as! String
                           let volume = ingredient["volume"] as! String
                           
                           let type = ingredient["type"] as! [String:Any]
                           let ingredientType = IngredientTypeModel(id: type["id"] as! String, imagePath: type["imagePath"] as! String, title: type["title"] as! String)
               
                           return IngredientModel(id: id, volume: volume, type: ingredientType)
                       }
                       
                       let stepsMap = aValue["steps"] as? [[String:Any]] ??  []
                       let steps = stepsMap.map{(step) -> CocktailPreparingStepModel in
                           return CocktailPreparingStepModel(description: step["description"] as! String, oder: step["order"] as! Int64)
                       }
                       
                   let cocktails = CocktailListModel(categories: categories, id: id, title: title, description: description, imagePath: imagePath, ingredients: ingredients, steps: steps)
                       
                   self.dataSource.append(cocktails)
                       
                   }
               }
           }
       }

    
    
    @IBAction func cookButton(_ sender: Any) {
        let vc = CocktailStepsVC(nibName: String(describing: CocktailStepsVC.self), bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
  }

extension CocktailInfoVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCell.identifier, for: indexPath) as! IngredientsCell
        return cell
    }
    
}

extension CocktailInfoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: Int(UIScreen.main.bounds.width) - 10, height:  Int(UIScreen.main.bounds.width / 4))
    }
}
