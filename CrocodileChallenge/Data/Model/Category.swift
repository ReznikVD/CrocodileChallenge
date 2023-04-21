//
//  Category.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 19.04.2023.
//

import Foundation

struct Category {
    let avatar: String
    let title: String
    let color: String
    
    static func getCategories() -> [Category] {
        return [
            Category(avatar: Resources.Images.frog, title: "Животные", color: Resources.Colors.purple),
            Category(avatar: Resources.Images.burger, title: "Еда", color: Resources.Colors.lightGreen),
            Category(avatar: Resources.Images.cowboy, title: "Личности", color: Resources.Colors.blue),
            Category(avatar: Resources.Images.nails, title: "Хобби", color: Resources.Colors.red)
        ]
    }

    enum typeCategory: String {
        case animal = "Животные"
        case food = "Еда"
        case persons = "Личности"
        case hobby = "Хобби"

    }

    struct Words {
        var category: Category

        init(category: Category) {
            self.category = category
        }

        func getWords() -> [String] {
            guard let type = typeCategory(rawValue: category.title) else { return [] }
            switch type {

            case .animal:
                return [""]
            case .food:
                return [""]
            case .persons:
                return [""]
            case .hobby:
                return [""]
            }
        }
    }
}
