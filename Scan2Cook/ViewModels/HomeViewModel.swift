//
//  HomeViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var lastSeenRecipes: [Recipe]
    @Published var todaysRecipes: [Recipe]
    @Published var newestRecipes: [Recipe]
    
    let userDefaults = UserDefaults.standard
    let lastSeenRecipesKey = "lastSeenRecipes"
    
    init(){
        lastSeenRecipes = Recipe.all
        todaysRecipes = Recipe.all
        newestRecipes = Recipe.all
    }
    
    func getLastSeenRecipes() -> [Recipe] {
        return Recipe.all
    }
    
    func getTodaysRecipes() -> [Recipe] {
        return Recipe.all
    }
    
    func getNewestRecipes() -> [Recipe] {
        return Recipe.all
    }
}
