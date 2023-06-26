//
//  ScanViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class ScanViewModel: ObservableObject {
    @Published var ingredients: [String]
    @Published var selectedIngredients: [String]
    @Published var searchText: String = ""
    @Published var lastSeenRecipesId: [String]
    @Published var lastSeenRecipes: [Recipe]
    
    let userDefaults = UserDefaults.standard
    let lastSeenRecipesIdKey = "lastSeenRecipesId"
    
    init(){
        self.ingredients = Ingredient.all
        self.selectedIngredients = []
        self.lastSeenRecipesId = userDefaults.stringArray(forKey: lastSeenRecipesIdKey) ?? []
        self.lastSeenRecipes = Recipe.all
    }
    
    var filteredIngredients: [String] {
        let subtractedIngredients = ingredients.filter { !self.selectedIngredients.contains($0) }
        
        guard !self.searchText.isEmpty else { return subtractedIngredients }
        
        let ingredientsTemp = subtractedIngredients.filter { recipe in
            recipe.lowercased().contains(self.searchText.lowercased())
        }
        
        return Array(ingredientsTemp)
    }
    
    func updateSelectedIngredients(ingredients: String) {
        if (self.selectedIngredients.contains(ingredients)) {
            self.selectedIngredients = self.selectedIngredients.filter { $0 != ingredients }
        } else {
            self.selectedIngredients.append(ingredients)
        }
    }
    
    func resetIngredientsSelection() {
        self.ingredients = Ingredient.all
        self.selectedIngredients = []
    }
}
