//
//  BookmarkViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class BookmarkViewModel: ObservableObject {
    @Published var bookmarkedRecipes: [Recipe]
    @Published var searchText: String = ""
    
    let userDefaults = UserDefaults.standard
    let bookmarkedRecipesKey = "bookmarkedRecipes"
    
    init(){
        bookmarkedRecipes = Recipe.all
    }
    
    func getBookmarkedRecipes() -> [Recipe] {
        return Recipe.all
    }
    
    var filteredMeals: [Recipe] {
        guard !searchText.isEmpty else { return bookmarkedRecipes }

        return bookmarkedRecipes.filter { recipe in
            recipe.name.lowercased().contains(searchText.lowercased())
        }
    }

}
