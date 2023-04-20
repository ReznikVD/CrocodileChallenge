//
//  GameManager.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 20.04.2023.
//

import Foundation

class GameManager {
    
    static let shared = GameManager()
    
    private init() {}
    
    private var currentTeam = Team.getTeam()[0]
    private var currentCategory = Category.getCategories()[0]
    var scores = [Team.getTeam()[0].name: 0, Team.getTeam()[1].name: 0]
    
    func getCurrentTeam() -> Team {
        return currentTeam
    }
    
    func getCurrentCategory() -> Category {
        return currentCategory
    }
    
    func setCategory(_ category: Category) {
        currentCategory = category
    }
    
    // TODO: - Add logic for change currentTeam
}
