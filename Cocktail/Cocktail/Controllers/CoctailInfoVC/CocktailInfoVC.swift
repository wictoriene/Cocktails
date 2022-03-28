//
//  CocktailInfoVC.swift
//  Cocktail
//
//  Created by wictoriene on 21.03.22.
//

import UIKit

class CocktailInfoVC: UIViewController {
    
    @IBOutlet weak var cocktailTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ingredientsCollection: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsCollection.dataSource = self
        ingredientsCollection.delegate = self


    }
    @IBAction func cookButton(_ sender: Any) {
        
    }
    
}

extension CocktailInfoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
