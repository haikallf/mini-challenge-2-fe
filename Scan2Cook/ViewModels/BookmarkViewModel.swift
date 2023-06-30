//
//  BookmarkViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class BookmarkViewModel: ObservableObject {
    @Published var bookmarkedRecipeIds: [String]
    @Published var bookmarkedRecipes: [RecipeThumbnailResponse]
    @Published var filteredRecipes: [RecipeThumbnailResponse]
    @Published var searchText: String = ""
    
    let userDefaults = UserDefaults.standard
    let bookmarkedRecipesKey = "bookmarkedRecipesIds"
    let globalStates = GlobalStates()
    
    init(){
        bookmarkedRecipeIds = userDefaults.stringArray(forKey: bookmarkedRecipesKey) ?? []
        bookmarkedRecipes = []
        filteredRecipes = []
        self.bookmarkedRecipes = []
        Task { [weak self] in
            await self?.getRecipeByIds()
        }
    }
    
    func updateBookmarkIds(bookmarkId: String) {
        if (self.bookmarkedRecipeIds.contains(bookmarkId)) {
            self.bookmarkedRecipeIds = self.bookmarkedRecipeIds.filter { $0 != bookmarkId }
        } else {
            self.bookmarkedRecipeIds.append(bookmarkId)
        }
        userDefaults.set(self.bookmarkedRecipeIds, forKey: bookmarkedRecipesKey)
        bookmarkedRecipeIds = userDefaults.stringArray(forKey: bookmarkedRecipesKey) ?? []
    }
    
    func filterRecipe() {
        if (searchText != "") {
            filteredRecipes = bookmarkedRecipes.filter { recipe in
                recipe.nama_resep.lowercased().contains(searchText.lowercased())
            }
        } else {
            filteredRecipes = bookmarkedRecipes
        }
    }
    
    var filteredMeals: [RecipeThumbnailResponse] {
        guard !searchText.isEmpty else { return bookmarkedRecipes }

        return bookmarkedRecipes.filter { recipe in
            recipe.nama_resep.lowercased().contains(searchText.lowercased())
        }
    }
    
    func getRecipeByIds(personalizations: [String] = [], cookingWare: [String] = [], cookingTime: [String] = [], ingredientsCount: [String] = []) async {
        let recipeIds = self.bookmarkedRecipeIds.joined(separator: ",")
        let personalizationsStr = personalizations.joined(separator: ",")
        let cookingTimeStr = cookingTime.joined(separator: ",")
        let cookingWareStr = cookingWare.joined(separator: ",")
        let ingredientsCount = ingredientsCount.joined(separator: ",")
        
        
        
        if (recipeIds.isEmpty) {
            return
        }
        
        guard let url = URL(string: "\(globalStates.baseURL)/resep?resepId=\(recipeIds)&personalisasiOrang=\(personalizationsStr)&alatMasak=\(cookingWareStr)&waktuPembuatan=\(cookingTimeStr)") else { fatalError("URL not found!") }
        print(url)
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decodedRecipe = try JSONDecoder().decode([RecipeThumbnailResponse].self, from: data)
                        self.bookmarkedRecipes = decodedRecipe
                        self.filteredRecipes = decodedRecipe
                    } catch let error {
                        print("Error decoding: ", error.localizedDescription)
//                        self.bookmarkedRecipes = []
                    }
                }
            } else {
//                self.bookmarkedRecipes = []
            }
        } catch {
            print("Request error: ", error.localizedDescription)
//            self.bookmarkedRecipes = []
        }
        print(filteredRecipes)
    }
}
