//
//  ApiManagerV2.swift
//  Cocktail
//
//  Created by wictoriene on 21.03.22.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseDatabase

class ApiManagerV2 {
    
    var _ref: DatabaseReference!
    static let shared = ApiManagerV2()
    
    init(){
        _ref = Database.database().reference()
    }
    
    func getCocktails()->[CocktailListModel]{
        var cocktails: [CocktailListModel] = []
        _ref.child("Cocktail").observeSingleEvent(of: .value, with: {(snapshot) in
            if let snapshotDict = snapshot.value as? [String:AnyObject]{
                for item in snapshotDict{
                    let cocktailProps = (item.value as! [String : String])
                    let cocktail = CocktailListModel(
                        id: cocktailProps["id"]!,
                        title: cocktailProps["title"]!,
                        description: cocktailProps["description"]!,
                        imagePath: cocktailProps["imagePath"]!
                    )
                    cocktails.append(cocktail)
                }
            }

        })
           
        return cocktails;
    }
    
}
