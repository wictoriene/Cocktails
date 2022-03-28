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

    @IBOutlet weak var chosenCategory: UILabel!
    @IBOutlet weak var cocktailsList: UITableView!

    
    var dataSource:[CocktailListModel] = []
    var choosenCocktail = 0
    var choosenCategoryText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chosenCategory.text = choosenCategoryText
        var ref: DatabaseReference!
        ref = Database.database().reference()

//        ApiManager.shared.getrealmTime { _ in ref.child("Cocktail").observeSingleEvent(of: .value, with: {(snapshot) in
//                if let snapshotDict = snapshot.value as? [String:AnyObject]{
//                    for item in snapshotDict{
//                        let cocktailProps = (item.value as! [String : String])
//                        let cocktails = CocktailListModel(
//                            id: cocktailProps["id"]!,
//                            title: cocktailProps["title"]!,
//                            description: cocktailProps["description"]!,
//                            imagePath: cocktailProps["imagePath"]!
//                        )
//                        self.dataSource.append(cocktails)
//                    }
//                }
//
//            })
//        }
//        ApiManagerV2.shared.getCocktails()
        ApiManager.shared.getCoctailsData()

//        chosenCategory.text = "Hi"
        cocktailsList.dataSource = self
        cocktailsList.delegate = self
        cocktailsList.register(UINib(nibName: "CocktailsList", bundle: nil), forCellReuseIdentifier: CocktailsList.identifier)

        
    }
}

//MARK: exstension CocktailsListVC

extension CocktailsListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CocktailsList.identifier, for: indexPath)
        return cell
    }
}
