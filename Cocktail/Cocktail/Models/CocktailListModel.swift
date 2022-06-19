//
//  CocktailListModel.swift
//  Cocktail
//
//  Created by wictoriene on 20.03.22.
//

import Foundation
import UIKit

struct CocktailListModel{
    var categories : [String]
    var id: String
    var title: String
    var description: String
    var imagePath: String
    var ingredients:[IngredientModel]
    var steps: [CocktailPreparingStepModel]
}

struct IngredientModel{
    var id: String
    var volume: String
    var type: IngredientTypeModel
}


struct IngredientTypeModel{
    var id: String
    var imagePath: String
    var title: String
}

struct CocktailPreparingStepModel{
    var description: String
    var oder: Int64
}
