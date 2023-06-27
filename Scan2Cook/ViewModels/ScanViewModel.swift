//
//  ScanViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class ScanViewModel: ObservableObject {
    @Published var ingredients: [Ingredient]
    @Published var selectedIngredients: [Ingredient]
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
    
    var filteredIngredients: [Ingredient] {
        let subtractedIngredients = ingredients.filter { !self.selectedIngredients.contains($0) }
        
        guard !self.searchText.isEmpty else { return subtractedIngredients }
        
        let ingredientsTemp = subtractedIngredients.filter { ingredient in
            ingredient.name.lowercased().contains(self.searchText.lowercased())
        }
        
        return Array(ingredientsTemp)
    }
    
    func updateSelectedIngredients(ingredient: Ingredient) {
        if (self.selectedIngredients.contains(ingredient)) {
            self.selectedIngredients = self.selectedIngredients.filter { $0 != ingredient }
        } else {
            self.selectedIngredients.append(ingredient)
        }
    }
    
    func setSelectedIngredients(arr: [Ingredient]) {
        self.selectedIngredients = arr
        print("\(selectedIngredients)")
    }
    
    func resetIngredientsSelection() {
        self.ingredients = Ingredient.all
        self.selectedIngredients = []
    }
}
