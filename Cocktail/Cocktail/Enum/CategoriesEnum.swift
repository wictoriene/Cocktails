//
//  CategoriesEnum.swift
//  Cocktail
//
//  Created by wictoriene on 11.06.22.
//

import Foundation

enum CategoriesEnum: String, CaseIterable {
    case floral
    case bitter
    case mint
    case vegetable
    case berry
    case sour
    case chocolate
    case classic
    case spicy
    case dry
    case coffee
    case herbal
    case tropical
    case sweet
    case creamy
    case salty
    case citrus
    case fruity
    
    
    var categoriesName: String {
        switch self {
        case .sweet:
            return "Сладкие"
        case .coffee:
            return "Кофейные"
        case .floral:
            return "Цветочные"
        case .bitter:
            return "Горькие"
        case .mint:
            return "Мятные"
        case .vegetable:
            return "Овощные"
        case .berry:
            return "Ягодные"
        case .sour:
            return "Кислые"
        case .chocolate:
            return "Шоколадные"
        case .classic:
            return "Классика"
        case .spicy:
            return "Пикантные"
        case .dry:
            return "Сухие"
        case .herbal:
            return "Травяные"
        case .tropical:
            return "Тропические"
        case .creamy:
            return "Сливочные"
        case .salty:
            return "Соленые"
        case .citrus:
            return "Цитрусовые"
        case .fruity:
            return "Фруктовые"
        }
    }
}




