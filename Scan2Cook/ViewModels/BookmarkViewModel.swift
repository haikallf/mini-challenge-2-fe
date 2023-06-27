//
//  BookmarkViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class BookmarkViewModel: ObservableObject {
    @Published var bookmarkedRecipes: [Recipe]
    @Published var filteredRecipes: [Recipe]
    @Published var searchText: String = ""
    
    let userDefaults = UserDefaults.standard
    let bookmarkedRecipesKey = "bookmarkedRecipes"
    
    init(){
        bookmarkedRecipes = Recipe.all
        filteredRecipes = Recipe.all
    }
    
    func getBookmarkedRecipes() -> [Recipe] {
        return Recipe.all
    }
    
    func filterRecipe() {
        if (searchText != "") {
            filteredRecipes = bookmarkedRecipes.filter { recipe in
                recipe.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var filteredMeals: [Recipe] {
        guard !searchText.isEmpty else { return bookmarkedRecipes }

        return bookmarkedRecipes.filter { recipe in
            recipe.name.lowercased().contains(searchText.lowercased())
        }
    }

}
