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

    @IBOutlet weak var cocktailsList: UICollectionView!
    
    
    var categoryEnum: CategoriesEnum = .berry
    
    var categoryArray:[String] = []
    
    var dataSource:[CocktailListModel] = []{
        didSet{
            cocktailsList.reloadData()
        }
    }
    var choosenCocktail = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cocktailsList.dataSource = self
        cocktailsList.delegate = self
        cocktailsList.register(UINib(nibName: "CocktailList", bundle: nil), forCellWithReuseIdentifier: CocktailList.identifier)
        
        getrealmTime()
        
    }
    
    private func filtrDataSource() {
//  Тебе нужно добавит в структуру переменную(масив) категорий, потом пробегаться циклом по массиву который пришел из Firebase ты выбираешь каждый элеиент и у этого элемента проверяешь категории с енамом
        for dataSource in dataSource {
            if dataSource.categories == categoryEnum.categoriesName {
            }
        }
    }
    
    private func getrealmTime(){
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ApiManager.shared.getrealmTime { snapshot in
            if let array = snapshot?.value as? [[String:Any]]{
                for aValue in array {
                    let categories = aValue["categories"] as? String ?? "nocategories"
                    let id = aValue["id"] as? String ?? "noid"
                    let title = aValue["title"] as? String ?? "notitle"
                    let description = aValue["description"] as? String ?? "nodescription"
                    let imagePath = aValue["imagePath"] as? String ?? "noimagePath"
                    let cocktails = CocktailListModel(categories: categories, id: id, title: title, description: description, imagePath: imagePath)
                    self.dataSource.append(cocktails)
                }
            }
        }
    }
    
}

//MARK: exstension CocktailsListVC

extension CocktailsListVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailList.identifier, for: indexPath) as! CocktailList
        cell.title.text = dataSource[indexPath.row].title
        cell.descriptionLabel.text = dataSource[indexPath.row].description
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CocktailInfoVC(nibName: String(describing: CocktailInfoVC.self), bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CocktailsListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: Int(UIScreen.main.bounds.width) - 10, height:  Int(UIScreen.main.bounds.width / 4))
    }
}
